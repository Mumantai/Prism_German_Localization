function patch(button) {
    var form = document.querySelector(".patcher-card");
    var fileInput = document.getElementById("rom-file-input");
    var bspInput = document.getElementById("bsp");

    if ((bspInput.files.length != 1) || (fileInput.files.length != 1)) {
        alert("Du musst eine Patch-Datei und eine ROM-Datei auswählen!");
        return;
    }

    var filename = fileInput.files[0].name;
    button.disabled = true;

    var bsp_data, input_data;

    var bsp_file_reader = new FileReader();
    bsp_file_reader.onload = function() {
        bsp_data = bsp_file_reader.result;
        if (input_data !== undefined) {
            begin_patch(bsp_data, input_data, filename);
            bsp_data = input_data = undefined;
        }
    };

    var input_file_reader = new FileReader();
    input_file_reader.onload = function() {
        input_data = input_file_reader.result;
        if (bsp_data !== undefined) {
            begin_patch(bsp_data, input_data, filename);
            bsp_data = input_data = undefined;
        }
    };

    bsp_file_reader.readAsArrayBuffer(bspInput.files[0]);
    input_file_reader.readAsArrayBuffer(fileInput.files[0]);
}

function create_message(message) {
    var messages = document.getElementById("messages");
    var message_element = document.createElement("p");
    message_element.innerText = message;

    // Container anzeigen, wenn er bisher versteckt war
    if (messages.classList.contains("hidden")) {
        messages.classList.remove("hidden");
    }

    if (messages.firstChild) {
        messages.insertBefore(message_element, messages.firstChild);
    } else {
        messages.appendChild(message_element);
    }
}

function create_menu(options, callback) {
    var messages = document.getElementById("messages");
    var div = document.createElement("div");
    var option, n;
    for (n = 0; n < options.length; n++) {
        option = document.createElement("input");
        option.type = "button";
        option.value = options[n];
        option.onclick = (function (num) {
            var p = document.createElement("p");
            p.style.fontStyle = "italic";
            p.innerText = options[num];
            messages.replaceChild(p, div);
            callback(num);
        }).bind(null, n);
        div.appendChild(option);
    }
    if (messages.firstChild) {
        messages.firstChild.style.color = "#666666";
        messages.insertBefore(div, messages.firstChild);
    } else
        messages.appendChild(div);
}

function escape_HTML(str) {
    var result = "";
    var pos;
    for (pos = 0; pos < str.length; pos++) result += "&#" + str.charCodeAt(pos) + ";";
    return result;
}

// Funktion zum Generieren des Ausgabedateinamens
function getOutputFilename(patchFilename, originalFilename) {
    // Extrahiere den Basisnamen der Patchdatei ohne Erweiterung
    var patchBaseName = patchFilename.split('.').slice(0, -1).join('.');

    // Prüfe, ob die Originaldatei eine ROM ist (durch Überprüfung der Erweiterung)
    var originalExt = originalFilename.split('.').pop().toLowerCase();
    var isROMFile = originalExt === 'gbc';

    // Wenn es eine ROM ist, verwende .gbc, sonst behalte die originale Erweiterung
    return isROMFile ? patchBaseName + '.gbc' : originalFilename;
}

function begin_patch(bsp, input, filename) {
    var patcher = new BSPPatcher(bsp, input);
    var patch_result = document.getElementById("result");

    // Suche nach dem versteckten Input-Element für die Patch-Datei
    var bspInput = document.getElementById("bsp");
    // Fallback für den Patch-Dateinamen, falls nicht verfügbar
    var patchFilename = (bspInput && bspInput.files && bspInput.files[0])
                         ? bspInput.files[0].name
                         : "patch";

    patcher.print = function (message) {
        create_message(message);
        patcher.run();
    };

    patcher.menu = function(options) {
        var menuContainer = document.createElement("div");
        menuContainer.className = "menu-container";

        var menuTitle = document.createElement("h3");
        menuTitle.textContent = "Bitte eine Option wählen:";
        menuContainer.appendChild(menuTitle);

        var menuList = document.createElement("div");
        menuList.className = "menu-options";

        options.forEach(function(option, index) {
            var button = document.createElement("button");
            button.textContent = option;
            button.onclick = function() {
                patch_result.innerHTML = "";
                patcher.run(index);
            };
            menuList.appendChild(button);
        });

        menuContainer.appendChild(menuList);
        patch_result.innerHTML = "";
        patch_result.appendChild(menuContainer);
    };

    patcher.success = function(result) {
        var downloadElement = document.createElement("a");

        // Generiere den Ausgabedateinamen
        var outputFilename = getOutputFilename(patchFilename, filename);

        downloadElement.href = URL.createObjectURL(new Blob([result]));
        downloadElement.download = outputFilename;
        downloadElement.innerHTML = "Gepatchte Datei herunterladen";

        patch_result.innerHTML = "";
        patch_result.appendChild(downloadElement);

        button.disabled = false;
    };

    patcher.failure = function(code) {
        patch_result.innerHTML = "Fehler: " + code;
        button.disabled = false;
    };

    patcher.error = function(message) {
        patch_result.innerHTML = "Fehler: " + message;
        button.disabled = false;
    };

    patcher.run();
}

//   Neue Funktionen, um automatisch die Patch-Datei aus dem Repository zu beziehen
// Auto-Loader für die Patch-Datei aus GitHub Releases mit CORS-Proxy
(() => {
    const OWNER = 'Mumantai';
    const REPO = 'Prism_German_Localization';
    const PATCH_INPUT_SELECTOR = '#bsp';
    const FALLBACK_FILENAME = 'pokeprism.bsp';

    function setStatus(msg) {
        const status = document.getElementById('result');
        if (status) status.textContent = msg;
    }

// GitHub API nutzen, um die URL des .bsp Assets zu finden
    async function findBspAssetInfo() {
        try {
            const response = await fetch(`https://api.github.com/repos/${OWNER}/${REPO}/releases/latest`);
            const data = await response.json();

            // Version aus dem Release-Tag extrahieren
            const version = data.tag_name || data.name || '';

            // Veröffentlichungsdatum extrahieren und formatieren
            const publishedDate = data.published_at ? new Date(data.published_at) : null;
            const formattedDate = publishedDate ?
                publishedDate.toLocaleDateString('de-DE', {
                    day: '2-digit',
                    month: '2-digit',
                    year: 'numeric'
                }) : '';

            // Asset suchen
            const asset = data.assets.find(asset => asset.name.endsWith('.bsp'));
            if (!asset) throw new Error('Keine .bsp-Datei im neuesten Release gefunden');

            return {
                url: asset.browser_download_url,
                filename: asset.name,
                version: version,
                date: formattedDate
            };
        } catch (error) {
            throw new Error(`Fehler beim Abrufen der Release-Informationen: ${error.message}`);
        }
    }

    // Die Datei über einen CORS-Proxy herunterladen
    async function downloadReleaseAsset(url) {
        setStatus(`Lade Patch-Datei...`);

        try {
            // CORS-Proxy verwenden - hier mit corsproxy.io
            const proxyUrl = `https://corsproxy.io/?${encodeURIComponent(url)}`;

            const response = await fetch(proxyUrl);
            if (!response.ok) throw new Error(`Download fehlgeschlagen: ${response.status}`);

            const blob = await response.blob();
            const filename = url.split('/').pop() || FALLBACK_FILENAME;

            return new File([blob], filename, {type: 'application/octet-stream'});
        } catch (e) {
            throw new Error(`Download fehlgeschlagen: ${e.message}`);
        }
    }

    // Die Datei in das Formular einfügen
    function setFileInput(file) {
        const input = document.querySelector(PATCH_INPUT_SELECTOR);
        if (!input) {
            console.error('Patch-Input-Element nicht gefunden');
            return;
        }

        try {
            const dt = new DataTransfer();
            dt.items.add(file);
            input.files = dt.files;
            input.dispatchEvent(new Event('change', {bubbles: true}));
        } catch (e) {
            console.error('Fehler beim Setzen der Datei:', e);
        }
    }

    // Funktion zur Berechnung und Anzeige der SHA1-Prüfsumme
    function calculateAndDisplaySHA1(file) {
        const reader = new FileReader();
        reader.onload = function () {
            // SHA1 mit Web Crypto API berechnen
            crypto.subtle.digest('SHA-1', reader.result)
                .then(function (hash) {
                    // SHA1 als Hex-String formatieren
                    const hashArray = Array.from(new Uint8Array(hash));
                    const hashHex = hashArray.map(b => ('0' + b.toString(16)).slice(-2)).join('');

                    // SHA1 im Checksummen-Bereich anzeigen
                    const checksumElement = document.getElementById('file-checksum');
                    checksumElement.textContent = hashHex;
                    checksumElement.parentElement.classList.remove('hidden');
                });
        };
        reader.readAsArrayBuffer(file);
    }

// Event-Listener für die Dateiauswahl
    document.addEventListener('DOMContentLoaded', function () {
        const romInput = document.querySelector('input[name="source"]');
        const patchButton = document.querySelector('.patch-button');
        const dropZone = document.querySelector('.drop-zone');
        const checksumContainer = document.querySelector('.checksum-container');

        // Bestehender Code für die Dateiauswahl
        romInput.addEventListener('change', function (e) {
            if (this.files.length > 0) {
                const file = this.files[0];
                const fileName = file.name;
                document.getElementById('selected-filename').textContent = fileName;

                // Button-Text und Checksumme basierend auf Dateityp anpassen
                if (fileName.toLowerCase().endsWith('.gbc')) {
                    // ROM-Datei: Checksumme anzeigen und Button-Text auf "ROM patchen" setzen
                    calculateAndDisplaySHA1(file);
                    checksumContainer.classList.remove('hidden');
                    patchButton.textContent = 'ROM patchen';
                } else if (fileName.toLowerCase().endsWith('.sav')) {
                    // Savefile: Checksumme ausblenden und Button-Text anpassen
                    checksumContainer.classList.add('hidden');
                    patchButton.textContent = 'Spielstand patchen';
                } else {
                    // Andere Dateitypen: Checksumme ausblenden
                    checksumContainer.classList.add('hidden');
                    patchButton.textContent = 'Datei patchen';
                }
            }
        });

        // Neue Drag & Drop Event-Handler
        ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
            dropZone.addEventListener(eventName, preventDefaults, false);
        });

        function preventDefaults(e) {
            e.preventDefault();
            e.stopPropagation();
        }

        // Visuelle Rückmeldung während des Drag-Vorgangs
        ['dragenter', 'dragover'].forEach(eventName => {
            dropZone.addEventListener(eventName, highlight, false);
        });

        ['dragleave', 'drop'].forEach(eventName => {
            dropZone.addEventListener(eventName, unhighlight, false);
        });

        function highlight() {
            dropZone.classList.add('drag-over');
        }

        function unhighlight() {
            dropZone.classList.remove('drag-over');
        }

        // Verarbeiten der gedropten Datei
        dropZone.addEventListener('drop', handleDrop, false);

        function handleDrop(e) {
            const dt = e.dataTransfer;
            const files = dt.files;

            if (files.length > 0) {
                romInput.files = files; // Dateien an das Input-Element übergeben
                romInput.dispatchEvent(new Event('change')); // Change-Event auslösen
            }
        }
    });

    // Hauptfunktion
    async function autoLoadPatch() {
        try {
            setStatus('Lade Patch von GitHub...');

            // Release-Informationen abrufen
            const assetInfo = await findBspAssetInfo();

            // Datei herunterladen
            const patchFile = await downloadReleaseAsset(assetInfo.url);

            // In das Formular einfügen
            setFileInput(new File([patchFile], assetInfo.filename, {type: 'application/octet-stream'}));

            // Versionsinformation anzeigen
            setStatus(`Patch geladen: ${assetInfo.filename} (Version ${assetInfo.version} vom ${assetInfo.date})`);

        } catch (error) {
            setStatus(`Fehler: ${error.message}`);
        }
    }

    // Beim Laden der Seite ausführen
    window.addEventListener('DOMContentLoaded', autoLoadPatch);
})();

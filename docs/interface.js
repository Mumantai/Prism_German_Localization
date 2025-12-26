function patch(button) {
    const form = document.querySelector(".patcher-card");
    const fileInput = document.getElementById("rom-file-input");
    const bspInput = document.getElementById("bsp");

    if ((bspInput.files.length !== 1) || (fileInput.files.length !== 1)) {
        alert("Du musst eine Patch-Datei und eine ROM-Datei auswählen!");
        return;
    }

    const filename = fileInput.files[0].name;
    button.disabled = true;
    
    // Hide the result container when patching starts
    const resultContainer = document.getElementById("result");
    resultContainer.classList.add("hidden");

    let bsp_data, input_data;

    const bsp_file_reader = new FileReader();
    bsp_file_reader.onload = function() {
        bsp_data = bsp_file_reader.result;
        if (input_data !== undefined) {
            begin_patch(bsp_data, input_data, filename, button);
            bsp_data = input_data = undefined;
        }
    };

    const input_file_reader = new FileReader();
    input_file_reader.onload = function() {
        input_data = input_file_reader.result;
        if (bsp_data !== undefined) {
            begin_patch(bsp_data, input_data, filename, button);
            bsp_data = input_data = undefined;
        }
    };

    bsp_file_reader.readAsArrayBuffer(bspInput.files[0]);
    input_file_reader.readAsArrayBuffer(fileInput.files[0]);
}

function create_message(message) {
    const messages = document.getElementById("messages");
    const message_element = document.createElement("p");
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
    const messages = document.getElementById("messages");
    
    // Container anzeigen, wenn er bisher versteckt war
    if (messages.classList.contains("hidden")) {
        messages.classList.remove("hidden");
    }
    
    const div = document.createElement("div");
    div.style.display = "flex";
    div.style.flexWrap = "wrap";
    div.style.gap = "10px";
    div.style.marginBottom = "15px";
    
    for (let n = 0; n < options.length; n++) {
        const option = document.createElement("input");
        option.type = "button";
        option.value = options[n];
        option.style.padding = "8px 16px";
        option.style.border = "1px solid var(--primary-color)";
        option.style.backgroundColor = "var(--primary-color)";
        option.style.color = "white";
        option.style.borderRadius = "4px";
        option.style.cursor = "pointer";
        option.style.transition = "background-color 0.2s";
        
        option.onmouseover = function() {
            option.style.backgroundColor = "var(--primary-color-dark)";
        };
        option.onmouseout = function() {
            option.style.backgroundColor = "var(--primary-color)";
        };
        
        option.onclick = (function (num) {
            const p = document.createElement("p");
            p.style.fontStyle = "italic";
            p.style.color = "var(--text-muted)";
            p.innerText = "Ausgewählt: " + options[num];
            messages.replaceChild(p, div);
            callback(num);
        }).bind(null, n);
        div.appendChild(option);
    }
    
    if (messages.firstChild) {
        messages.firstChild.style.color = "#666666";
        messages.insertBefore(div, messages.firstChild);
    } else {
        messages.appendChild(div);
    }
}

function escape_HTML(str) {
    let result = "";
    for (let pos = 0; pos < str.length; pos++) {
        result += "&#" + str.charCodeAt(pos) + ";";
    }
    return result;
}

// Funktion zum Generieren des Ausgabedateinamens
function getOutputFilename(patchFilename, originalFilename) {
    // Extrahiere den Basisnamen der Patchdatei ohne Erweiterung
    const patchBaseName = patchFilename.split('.').slice(0, -1).join('.');

    // Prüfe, ob die Originaldatei eine ROM ist (durch Überprüfung der Erweiterung)
    const originalExt = originalFilename.split('.').pop().toLowerCase();
    const isROMFile = originalExt === 'gbc';

    // Wenn es eine ROM ist, verwende .gbc, sonst behalte die originale Erweiterung
    return isROMFile ? patchBaseName + '.gbc' : originalFilename;
}

function begin_patch(bsp, input, filename, button) {
    try {


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

        patcher.menu = function (options) {
            const messages = document.getElementById("messages");
            
            // Container anzeigen, wenn er bisher versteckt war
            if (messages.classList.contains("hidden")) {
                messages.classList.remove("hidden");
            }

            var menuTitle = document.createElement("p");
            menuTitle.textContent = "Bitte eine Option wählen:";
            menuTitle.style.fontWeight = "bold";
            menuTitle.style.color = "var(--primary-color-dark)";
            menuTitle.style.marginBottom = "10px";

            var menuList = document.createElement("div");
            menuList.className = "menu-options";
            menuList.style.display = "flex";
            menuList.style.flexWrap = "wrap";
            menuList.style.gap = "10px";
            menuList.style.marginBottom = "15px";

            options.forEach(function (option, index) {
                var button = document.createElement("button");
                button.textContent = option;
                button.style.padding = "8px 16px";
                button.style.border = "1px solid var(--primary-color)";
                button.style.backgroundColor = "var(--primary-color)";
                button.style.color = "white";
                button.style.borderRadius = "4px";
                button.style.cursor = "pointer";
                button.style.transition = "background-color 0.2s";
                
                button.onmouseover = function() {
                    button.style.backgroundColor = "var(--primary-color-dark)";
                };
                button.onmouseout = function() {
                    button.style.backgroundColor = "var(--primary-color)";
                };
                
                button.onclick = function () {
                    // Entferne das Menu aus den Nachrichten
                    const menuElements = messages.querySelectorAll('.menu-options, p[style*="font-weight: bold"]');
                    menuElements.forEach(el => el.remove());
                    
                    // Füge Auswahl-Nachricht hinzu
                    const selectionMessage = document.createElement("p");
                    selectionMessage.textContent = "Ausgewählt: " + option;
                    selectionMessage.style.fontStyle = "italic";
                    selectionMessage.style.color = "var(--text-muted)";
                    
                    if (messages.firstChild) {
                        messages.insertBefore(selectionMessage, messages.firstChild);
                    } else {
                        messages.appendChild(selectionMessage);
                    }
                    
                    patch_result.innerHTML = "";
                    patcher.run(index);
                };
                menuList.appendChild(button);
            });

            // Füge Titel und Buttons zum messages Container hinzu
            if (messages.firstChild) {
                messages.insertBefore(menuList, messages.firstChild);
                messages.insertBefore(menuTitle, menuList);
            } else {
                messages.appendChild(menuTitle);
                messages.appendChild(menuList);
            }
            
            patch_result.innerHTML = "";
        };

        patcher.success = function (result) {
            // Generiere den Ausgabedateinamen
            var outputFilename = getOutputFilename(patchFilename, filename);

            // Transform patch button into download button
            button.textContent = "Gepatchte Datei herunterladen";
            button.disabled = false;
            
            // Create download functionality for the button
            button.onclick = function() {
                var downloadElement = document.createElement("a");
                downloadElement.href = URL.createObjectURL(new Blob([result]));
                downloadElement.download = outputFilename;
                downloadElement.style.display = "none";
                document.body.appendChild(downloadElement);
                downloadElement.click();
                document.body.removeChild(downloadElement);
            };
        };

        patcher.failure = function (code) {
            // Show result container again for error display
            const resultContainer = document.getElementById("result");
            resultContainer.classList.remove("hidden");
            patch_result.innerHTML = "Fehler: " + code;
            button.disabled = false;
        };

        patcher.error = function (message) {
            // Show result container again for error display
            const resultContainer = document.getElementById("result");
            resultContainer.classList.remove("hidden");
            patch_result.innerHTML = "Fehler: " + message;
            button.disabled = false;
        };

        patcher.run();
    }
    catch (error) {
        console.error("Patch-Fehler:", error);
        // Show result container again for error display
        const resultContainer = document.getElementById("result");
        resultContainer.classList.remove("hidden");
        resultContainer.innerHTML =
            `<div class="error-message">Fehler beim Patchen: ${error.message || "Unbekannter Fehler"}</div>`;
        button.disabled = false;
    }
}

//   Neue Funktionen, um automatisch die Patch-Datei aus dem Repository zu beziehen
// Auto-Loader für die Patch-Datei aus GitHub Releases (direkt, ohne CORS-Proxy)
(() => {
    const OWNER = 'Mumantai';
    const REPO = 'Prism_German_Localization';
    const PATCH_INPUT_SELECTOR = '#bsp';
    const FALLBACK_FILENAME = 'pokeprism.bsp';

    function setStatus(msg, isLoading = false) {
        const status = document.getElementById('result');
        if (!status) return;

        // Vorherigen Inhalt löschen
        status.innerHTML = '';

        // Bei Ladevorgang einen Spinner hinzufügen
        if (isLoading) {
            const spinner = document.createElement('div');
            spinner.className = 'loading-spinner';
            status.appendChild(spinner);
        }

        const message = document.createElement('p');
        message.textContent = msg;
        status.appendChild(message);
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

    // Die Datei direkt von GitHub herunterladen (CORS wird von GitHub unterstützt)
async function downloadReleaseAsset(url) {
    setStatus(`Lade Patch-Datei...`, true);

    try {
        // GitHub Release-Assets werden mit CORS-Headern ausgeliefert, daher kein Proxy nötig
        const response = await fetch(url);
        
        if (!response.ok) {
            throw new Error(`HTTP-Fehler ${response.status}: ${response.statusText}`);
        }

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
            setStatus('Lade Patch von GitHub...', true);

            // Release-Informationen abrufen
            const assetInfo = await findBspAssetInfo();

            // Datei herunterladen
            const patchFile = await downloadReleaseAsset(assetInfo.url);

            // In das Formular einfügen
            setFileInput(new File([patchFile], assetInfo.filename, {type: 'application/octet-stream'}));

            // Versionsinformation anzeigen
            setStatus(`Patch geladen: ${assetInfo.filename} (Version ${assetInfo.version} vom ${assetInfo.date})`, false);

        } catch (error) {
            setStatus(`Fehler: ${error.message}`, false);
        }
    }

    // Theme Toggle Functionality
    function initThemeToggle() {
        const themeToggle = document.getElementById('theme-toggle');
        const iconPath = document.getElementById('icon-path');
        
        // SVG paths for moon and sun icons
        const moonPath = "M21.64,13a1,1,0,0,0-1.05-.14,8.05,8.05,0,0,1-3.37.73A8.15,8.15,0,0,1,9.08,5.49a8.59,8.59,0,0,1,.25-2A1,1,0,0,0,8,2.36,10.14,10.14,0,1,0,22,14.05,1,1,0,0,0,21.64,13Zm-9.5,6.69A8.14,8.14,0,0,1,7.08,5.22v.27A10.15,10.15,0,0,0,17.22,15.63a9.79,9.79,0,0,0,2.1-.22A8.11,8.11,0,0,1,12.14,19.73Z";
        const sunPath = "M5.64,17l-.71.71a1,1,0,0,0,0,1.41,1,1,0,0,0,1.41,0l.71-.71A1,1,0,0,0,5.64,17ZM5,12a1,1,0,0,0-1-1H3a1,1,0,0,0,0,2H4A1,1,0,0,0,5,12Zm7-7a1,1,0,0,0,1-1V3a1,1,0,0,0-2,0V4A1,1,0,0,0,12,5ZM5.64,7.05a1,1,0,0,0,.7.29,1,1,0,0,0,.71-.29,1,1,0,0,0,0-1.41l-.71-.71A1,1,0,0,0,4.93,6.34Zm12,.29a1,1,0,0,0,.7-.29l.71-.71a1,1,0,1,0-1.41-1.41L17,5.64a1,1,0,0,0,0,1.41A1,1,0,0,0,17.66,7.34ZM21,11H20a1,1,0,0,0,0,2h1a1,1,0,0,0,0-2Zm-9,8a1,1,0,0,0-1,1v1a1,1,0,0,0,2,0V20A1,1,0,0,0,12,19ZM18.36,17A1,1,0,0,0,17,18.36l.71.71a1,1,0,0,0,1.41,0,1,1,0,0,0,0-1.41ZM12,6.5A5.5,5.5,0,1,0,17.5,12,5.51,5.51,0,0,0,12,6.5Zm0,9A3.5,3.5,0,1,1,15.5,12,3.5,3.5,0,0,1,12,15.5Z";
        
        // Get user's saved theme preference or detect system preference
        function getPreferredTheme() {
            const savedTheme = localStorage.getItem('theme');
            if (savedTheme) {
                return savedTheme;
            }
            return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
        }
        
        // Apply theme to body and update icon
        function applyTheme(theme) {
            document.body.className = theme + '-theme';
            if (iconPath) {
                iconPath.setAttribute('d', theme === 'dark' ? sunPath : moonPath);
            }
            localStorage.setItem('theme', theme);
        }
        
        // Toggle between light and dark themes
        function toggleTheme() {
            const currentTheme = document.body.classList.contains('dark-theme') ? 'dark' : 'light';
            const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
            applyTheme(newTheme);
        }
        
        // Initialize theme on page load
        applyTheme(getPreferredTheme());
        
        // Add click event listener
        themeToggle.addEventListener('click', toggleTheme);
        
        // Listen for system theme changes when no manual preference is set
        window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
            if (!localStorage.getItem('theme')) {
                applyTheme(e.matches ? 'dark' : 'light');
            }
        });
    }

    // Beim Laden der Seite ausführen
    window.addEventListener('DOMContentLoaded', () => {
        autoLoadPatch();
        initThemeToggle();
    });
})();

document.addEventListener("turbo:load", () => {
    let inputField = document.getElementById('sake_meter_value');

    inputField.removeAttribute('readonly');  // 初期化時にreadonly属性を削除

    function addNumber(number) {
        inputField.removeAttribute('readonly');
        inputField.value += number;
    }

    function addOperator(operator) {
        if (operator === '.' && !inputField.value.includes('.')) {
            inputField.removeAttribute('readonly');
            inputField.value += operator;
        } else if (operator === '-' && (inputField.value === '' || !inputField.value.startsWith('-'))) {
            inputField.removeAttribute('readonly');
            inputField.value = '-' + inputField.value;
        } else if (operator === '+' && (inputField.value === '' || /^[0-9]+$/.test(inputField.value))) {
            inputField.removeAttribute('readonly');
            inputField.value = '+' + inputField.value;
        }
    }

    function clearInput() {
        inputField.value = '';  // 入力をクリア
        inputField.removeAttribute('readonly');  // readonly属性を削除
    }

    // グローバルにアクセスできるように登録
    window.addNumber = addNumber;
    window.addOperator = addOperator;
    window.clearInput = clearInput;
});


document.addEventListener("turbo:load", () => {
    const fileInput = document.getElementById("label-image-input");
    const previewContainer = document.getElementById("label-image-preview");

    if (fileInput) {
        fileInput.addEventListener("change", (event) => {
            const files = event.target.files;
            if (files && files[0]) {
                const reader = new FileReader();

                reader.onload = (e) => {
                    previewContainer.innerHTML = `<img src="${e.target.result}" alt="選択された画像" class="mt-2 max-w-xs rounded-md shadow-md">`;
                };

                reader.readAsDataURL(files[0]);
            } else {
                previewContainer.innerHTML = `<p class="text-sm text-gray-500">プレビューがここに表示されます。</p>`;
            }
        });
    }
});


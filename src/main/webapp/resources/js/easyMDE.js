const contentEl = document.getElementById("content");

// EasyMDE 초기화
if (contentEl) {
    const easyMDE = new EasyMDE({
        element: document.getElementById("content"),
        placeholder: "내용을 입력하세요. **굵게**, _기울임_, `코드`, 목록 등 마크다운 지원!",
        spellChecker: false,
        autosave: { enabled: false },
        toolbar: [
            "bold", "italic", "heading", "|",
            "quote", "unordered-list", "ordered-list", "|",
            "link", "image", "code", "|",
            "preview", "side-by-side", "fullscreen", "|",
            "guide"
        ],
    });
}

// 폼 제출 시 유효성 검사
const form = document.querySelector(".post-form");
if (form) {
    form.addEventListener("submit", function (event) {
        easyMDE.value(easyMDE.codemirror.getValue());

        const contentValue = easyMDE.value();
        if (!contentValue.trim()) {
            alert("내용을 입력하세요!");
            event.preventDefault();
            easyMDE.codemirror.focus();
        }
    });
}

document.addEventListener("DOMContentLoaded", () => {
    const markdownTargets = document.querySelectorAll(".markdown-content");
    markdownTargets.forEach(el => {
        const rawText = el.innerText;
        el.innerHTML = marked.parse(rawText);
    });
});
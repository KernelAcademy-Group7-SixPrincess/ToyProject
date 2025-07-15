document.addEventListener("DOMContentLoaded", function () {
    const selectAll = document.getElementById("selectAll");
    const itemChecks = () => Array.from(document.querySelectorAll(".item-check"));
    const cartList = document.querySelector(".cart-list");
    const totalPriceEl = document.getElementById("totalPrice");
    const deleteSelectedBtn = document.getElementById("deleteSelected");
    const cartForm = document.getElementById("cartForm");

    // 금액 파싱
    function parsePrice(str) {
        return parseInt(str.replace(/[^0-9]/g, ""), 10) || 0;
    }
    // 금액 포맷
    function formatPrice(num) {
        return num.toLocaleString("ko-KR") + "원";
    }
    // 총액 계산
    function updateTotal() {
        let total = 0;
        itemChecks().forEach((chk) => {
            if (chk.checked) {
                const price = chk.closest(".cart-item").querySelector(".item-price").textContent;
                total += parsePrice(price);
            }
        });
        totalPriceEl.textContent = formatPrice(total);
    }
    // 전체선택
    selectAll.addEventListener("change", function () {
        itemChecks().forEach((chk) => {
            chk.checked = selectAll.checked;
        });
        updateTotal();
    });
    // 개별 체크박스
    cartList.addEventListener("change", function (e) {
        if (e.target.classList.contains("item-check")) {
            // 전체선택 체크박스 상태 동기화
            const all = itemChecks();
            selectAll.checked = all.length > 0 && all.every((chk) => chk.checked);
            updateTotal();
        }
    });
    // 개별 삭제
    cartList.addEventListener("click", function (e) {
        if (e.target.classList.contains("item-delete")) {
            const li = e.target.closest(".cart-item");
            li.remove();
            updateTotal();
            // 전체선택 체크박스 상태 동기화
            const all = itemChecks();
            selectAll.checked = all.length > 0 && all.every((chk) => chk.checked);
        }
    });
    // 선택삭제
    deleteSelectedBtn.addEventListener("click", function () {
        itemChecks().forEach((chk) => {
            if (chk.checked) {
                chk.closest(".cart-item").remove();
            }
        });
        updateTotal();
        // 전체선택 체크박스 상태 동기화
        const all = itemChecks();
        selectAll.checked = all.length > 0 && all.every((chk) => chk.checked);
    });
    // 결제 버튼
    cartForm.addEventListener("submit", function (e) {
        e.preventDefault();
        const selected = itemChecks().filter((chk) => chk.checked);
        if (selected.length === 0) {
            alert("결제할 숙소를 선택하세요.");
            return;
        }
        window.location.href = contextPath + "/reservation/complete";

    });
    // 페이지 진입시 총액 초기화
    updateTotal();
});

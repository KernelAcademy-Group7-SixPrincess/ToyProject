
document.addEventListener('DOMContentLoaded', () => {
    const minusBtn = document.querySelector('.guest-btn.minus');
    const plusBtn  = document.querySelector('.guest-btn.plus');
    const countTxt = document.querySelector('.guest-count-text');

    let count = parseInt(countTxt.textContent, 10);

    minusBtn.addEventListener('click', () => {
        if (count > 0) count--;
        countTxt.textContent = count;
    });

    plusBtn.addEventListener('click', () => {
        count++;
        countTxt.textContent = count;
    });

    loadCodes('ACCOMMODATION_TYPE');
});

function loadCodes(codeTypeId) {
    fetch(`${contextPath}/code/${codeTypeId}`)
        .then(res => res.json())
        .then(codes => renderCodes(codes, codeTypeId))
        .catch(console.error);
}

function renderCodes(codes, codeTypeId) {
    const group = document.getElementById('filter-category-group');
    group.innerHTML = '';
    codes.forEach((c, i) => {
        const div = document.createElement('div');
        div.className = 'gc-radio';
        div.setAttribute('role', 'radio');
        div.setAttribute('aria-checked', i === 0);
        div.tabIndex = 0;
        div.dataset.typeId = codeTypeId;
        div.dataset.value  = c.code;
        div.innerHTML = `
      <button class="radio-btn"><div></div></button>
      <span class="radio-label">${c.codeName}</span>
    `;
        div.addEventListener('click', () => {
            group.querySelectorAll('.gc-radio').forEach(el => el.setAttribute('aria-checked', 'false'));
            div.setAttribute('aria-checked', 'true');
            doSearch();
        });
        group.appendChild(div);
    });
}

function doSearch() {
    const selectedRadio = document.querySelector('.gc-radio[aria-checked="true"]');
    const codeTypeId = selectedRadio?.dataset.typeId;
    const code       = selectedRadio?.dataset.value;
    const guests     = document.querySelector('.guest-count-text').textContent;

    const params = new URLSearchParams();
    if (codeTypeId) params.set('codeTypeId', codeTypeId);
    if (code)       params.set('code', code);
    params.set('guests', guests);

    fetch(`${contextPath}/api/search?${params}`)
        .then(res => res.ok ? res.json() : Promise.reject(res.statusText))
        .then(renderSearchResults)
        .catch(console.error);
}

function renderSearchResults(results) {
    const container = document.getElementById('cards-container');
    container.innerHTML = '';
    results.forEach(r => {
        const article = document.createElement('article');
        article.className = 'card';
        article.innerHTML = `
      <img src="${r.imageUrl}" alt="${r.name}"/>
      <div class="card-content">
        <ul class="type-list"><li>${r.type}</li></ul>
        <h3>${r.name}</h3>
        <p class="details">${r.location}</p>
        <div class="price-section"><span class="price">₩${r.price.toLocaleString()}</span></div>
      </div>
    `;
        container.appendChild(article);
    });
}

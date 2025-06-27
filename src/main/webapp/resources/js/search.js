
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
    // 히든 인풋 대신 dataset 사용
    const codeTypeId = selectedRadio.dataset.typeId;
    const code       = parseInt(selectedRadio.dataset.value, 10) || null;
    const guests     = parseInt(document.querySelector('.guest-count-text').textContent, 10) || 0;
    const keyword       = document.querySelector('.input-keyword').value.trim();

    const params = new URLSearchParams();
    if (keyword)    params.set('keyword',    keyword);
    params.set('guests', guests);
    if (codeTypeId) params.set('codeTypeId', codeTypeId);
    if (code !== null) params.set('code', code);

    fetch(`${contextPath}/api/search?${params}`)
        .then(res => {
            if (!res.ok) throw new Error(res.statusText);
            return res.json();
        })
        .then(data => renderSearchResults(data))
        .catch(err => console.error('검색 중 에러 발생:', err));
}


function renderSearchResults(results) {
    const container = document.getElementById('cards-container');
    container.innerHTML = '';

    const header = document.createElement('header');
    const title  = document.createElement('h3');
    title.className     = 'title';
    title.textContent   = `전체 개수 : ${results.length}개`;
    header.appendChild(title);
    container.appendChild(header);

    results.forEach(r => {
        const article = document.createElement('article');
        article.className = 'card';
        article.style.cursor = 'pointer';

        article.addEventListener('click', () => {
            location.href = `${contextPath}/acc/${region}/${r.accId}`;
        });

        article.innerHTML = `
      <img src="${r.mainImageUrl}" alt="${r.name}"/>
      <div class="card-content">
        <ul class="type-list">
            <li>${r.typeCodeName}</li>
        </ul>
        <h3>${r.name}</h3>
        <p class="details">${r.address}</p>
      </div>
    `;
        container.appendChild(article);
    });
}

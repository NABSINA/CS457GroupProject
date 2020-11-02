// const fetch = require('node-fetch');

const searchTxt = document.getElementById('searchTxt');
const searchBtn = document.getElementById('searchBtn');
const divSearchResults = document.getElementById('searchResults');
const proxy = 'http://pi.nathangawith.com:575/';

searchBtn.addEventListener('click', () => btnSearch(searchTxt.value));

function getURL(url, isJSON) {
    return fetch(url).then(x => isJSON ? x.json() : x.text());
}


function getItemForSKU(sku) {
    const url = `${proxy}https://www.bestbuy.com/api/tcfb/model.json?paths=%5B%5B%22shop%22%2C%22magellan%22%2C%22v1%22%2C%22item%22%2C%22skus%22%2C%22${sku}%22%5D%5D&method=get`;
    return getURL(url, true).then(apiItemObject => {
        const sku = Object.keys(apiItemObject.jsonGraph.shop.magellan.v1.item.skus)[0];
        const keyValues = [
            'brand', 'skuDescription', 'unitRetail'
        ].map(key => [key, apiItemObject.jsonGraph.shop.magellan.v1.item.skus[sku].value[key]]);
        return {
            sku,
            name: keyValues.find(x => x[0] === 'skuDescription')[1],
            brand: keyValues.find(x => x[0] === 'brand')[1],
            price: keyValues.find(x => x[0] === 'unitRetail')[1],
            imageURL: `https://pisces.bbystatic.com/image2/BestBuy_US/images/products/${sku.substring(0, 4)}/${sku}_sd.jpg`,
        };
    });
}

function getSKUsForSearch(searchTerm) {
    const searchURL = st => `${proxy}https://www.bestbuy.com/site/searchpage.jsp?st=${st}&_dyncharset=UTF-8&_dynSessConf=&id=pcat17071&type=page&sc=Global&cp=1&nrp=&sp=&qp=&list=n&af=true&iht=y&usc=All+Categories&ks=960&keys=keys`;
    return getURL(searchURL(searchTerm)).then(html =>
        html.split('<span class="sku-value">')
            .map(x => x.split('</span>')[0])
            .filter(skuCandidate => !skuCandidate.split('')
                                    .map(char => '0123456789'.includes(char))
                                    .includes(false)
    ));
}

function btnSearch(searchTerm) {
    getSKUsForSearch(searchTerm).then(skus => {
        divSearchResults.innerHTML = '';
        Promise.all(skus.map(sku => getItemForSKU(sku).then(info => {
            const div = document.createElement('div');
            div.innerHTML = `
                <h2>${info.name}</h2>
                <div>$${info.price}</div>
                <div>${info.brand}</div>
                <div>${info.sku}</div>
                <img src="${info.imageURL}" width="250px"></img>
            `;
            divSearchResults.appendChild(div);
            return info;
        }))).then(items => {
            console.log(items);
            console.log(JSON.stringify(items, null, 4));
        });
    });
}

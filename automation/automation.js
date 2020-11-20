((category, title, sku, brand, price) => {
    const myEles = document.querySelector(`[value="${category}"]`);
    (myEles ? myEles.click() : undefined);
    const setValue = (name, value) => {
        const input = document.querySelector(`[name="${name}"]`);
        (input ? input.value = value : undefined);
    }
    setValue('title', title);
    setValue('stocknum', 1);
    setValue('stockquantity', 1);
    setValue('upc', sku);
    setValue('_sku', sku);
    setValue('content', `${title}\n${brand}`);
    for (let i = 1; i <= 5; i++) {
        setValue(`price${i}title`, `Price of ${i} ${title}`);
        setValue(`price${i}`, (price * i).toFixed(2));
        setValue(`quantity${i}`, i);
    }
    const btnSubmit = document.querySelector('[value="Submit"]');
    btnSubmit.click();
})('peripherals/mice', 'Awesome mouse', '1234567', 'brand', 3.14);

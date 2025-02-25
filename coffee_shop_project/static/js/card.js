// Функция для добавления товара в корзину
function addToCart(productName, price, image) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const existingProduct = cart.find(item => item.name === productName);

    if (existingProduct) {
        existingProduct.quantity += 1;
    } else {
        cart.push({
            name: productName,
            price: price,
            image: image,
            quantity: 1
        });
    }

    localStorage.setItem('cart', JSON.stringify(cart));
    updateCartCount();
}

// Функция для обновления отображения количества товаров в корзине
function updateCartCount() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const cartCount = document.getElementById("cart-count");
    const totalCount = cart.reduce((total, item) => total + item.quantity, 0);
    cartCount.textContent = totalCount;
}

// Функция для обновления отображения товаров в корзине
function updateCartDisplay() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const cartItemsList = document.getElementById("cart-items-list");
    const totalPriceElement = document.getElementById("total-price");

    cartItemsList.innerHTML = '';

    if (cart.length === 0) {
        cartItemsList.innerHTML = '<p>Ваша корзина пуста.</p>';
        totalPriceElement.textContent = 'Итого: 0 Руб';
        return;
    }

    cart.forEach(item => {
        const itemElement = document.createElement("div");
        itemElement.classList.add("card");

        itemElement.innerHTML = `
            <img src="${item.image}" alt="${item.name}">
            <h1>${item.name}</h1>
            <p>${item.quantity} x ${item.price} Руб</p>
            <p class="price">Итого: ${item.quantity * item.price} Руб</p>
            <button onclick="removeFromCart('${item.name}')">Удалить</button>
        `;

        cartItemsList.appendChild(itemElement);
    });

    const totalPrice = cart.reduce((total, item) => total + (item.price * item.quantity), 0);
    totalPriceElement.textContent = `Итого: ${totalPrice} Руб`;
}

// Функция для удаления товара из корзины
function removeFromCart(productName) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    cart = cart.filter(item => item.name !== productName);
    localStorage.setItem('cart', JSON.stringify(cart));
    updateCartDisplay();
    updateCartCount();
}

// Функция для оформления заказа
function checkout() {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    if (cart.length === 0) {
        alert('Ваша корзина пуста! Добавьте товары в корзину перед оформлением заказа.');
        return;
    }

    alert('Ваш заказ оформлен! Спасибо за покупку!');
    localStorage.removeItem('cart'); // Удаляем корзину после оформления заказа
    updateCartDisplay();
    updateCartCount();
}

// Вставляем товары в корзину при загрузке страницы cart.html
if (document.getElementById("cart-items-list")) {
    updateCartDisplay();
    updateCartCount();
} else {
    updateCartCount();
}





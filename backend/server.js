const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
require('./passport')
const session = require('express-session');
// Khởi tạo ứng dụng express
const app = express();

// Sử dụng body-parser để parse request body
app.use(bodyParser.json());
app.use(cors());


app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.use(session({
    secret: '123456',
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false }
}));


// Import router sản phẩm
const productRoutes = require('./src/routes/product.route');
const categoryRoutes = require('./src/routes/category.route');
const colorRoutes = require('./src/routes/color.route');
const productColorRoutes = require('./src/routes/productColor.route');
const productImagesRoutes = require('./src/routes/imageProduct.route');
const userRoutes = require('./src/routes/user.route');
const orderRoutes = require('./src/routes/orders.route');
const orderDetailRoutes = require('./src/routes/orderDetails.route');
const menuRoutes = require('./src/routes/menu.route');
const postRoutes = require('./src/routes/post.route');
const contactRoutes = require('./src/routes/contact.route');
const authRoutes = require('./src/routes/auth.route');


// Đăng ký router sản phẩm tại đường dẫn /products
app.use('/api/products', productRoutes);
app.use('/api/categories', categoryRoutes);
app.use('/api/colors', colorRoutes);
app.use('/api/products-color', productColorRoutes);
app.use('/api/product-images', productImagesRoutes);
app.use('/api/user', userRoutes);
app.use('/api/order', orderRoutes);
app.use('/api/order-detail', orderDetailRoutes);
app.use('/api/menu', menuRoutes);
app.use('/api/post', postRoutes);
app.use('/api/auth', authRoutes);
app.use('/api/contact', contactRoutes);


// Cấu hình port và chạy server
const port = process.env.PORT || 1337;
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});

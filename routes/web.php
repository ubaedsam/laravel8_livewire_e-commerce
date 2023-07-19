<?php

use App\Http\Livewire\CartComponent;
use App\Http\Livewire\HomeComponent;
use App\Http\Livewire\ShopComponent;
use Illuminate\Support\Facades\Route;
use App\Http\Livewire\SearchComponent;
use App\Http\Livewire\ContactComponent;
use App\Http\Livewire\DetailsComponent;
use App\Http\Livewire\CategoryComponent;
use App\Http\Livewire\CheckoutComponent;
use App\Http\Livewire\ThankyouComponent;
use App\Http\Livewire\WishlistComponent;
use App\Http\Livewire\User\UserOrderComponent;
use App\Http\Livewire\Admin\AdminSaleComponent;
use App\Http\Livewire\User\UserReviewComponent;
use App\Http\Livewire\Admin\AdminOrderComponent;
use App\Http\Livewire\User\UserProfileComponent;
use App\Http\Livewire\Admin\AdminContactComponent;
use App\Http\Livewire\Admin\AdminCouponsComponent;
use App\Http\Livewire\Admin\AdminProductComponent;
use App\Http\Livewire\Admin\AdminSettingComponent;
use App\Http\Livewire\User\UserDashboardComponent;
use App\Http\Livewire\Admin\AdminCategoryComponent;
use App\Http\Livewire\Admin\AdminAddCouponComponent;
use App\Http\Livewire\Admin\AdminDashboardComponent;
use App\Http\Livewire\User\UserEditProfileComponent;
use App\Http\Livewire\Admin\AdminAddProductComponent;
use App\Http\Livewire\Admin\AdminAttributesComponent;
use App\Http\Livewire\Admin\AdminEditCouponComponent;
use App\Http\Livewire\Admin\AdminHomeSliderComponent;
use App\Http\Livewire\User\UserOrderDetailsComponent;
use App\Http\Livewire\Admin\AdminAddCategoryComponent;
use App\Http\Livewire\Admin\AdminEditProductComponent;
use App\Http\Livewire\Admin\AdminAddAttributeComponent;
use App\Http\Livewire\Admin\AdminEditCategoryComponent;
use App\Http\Livewire\Admin\AdminHomeCategoryComponent;
use App\Http\Livewire\Admin\AdminOrderDetailsComponent;
use App\Http\Livewire\User\UserChangePasswordComponent;
use App\Http\Livewire\Admin\AdminAddHomeSliderComponent;
use App\Http\Livewire\Admin\AdminEditAttributeComponent;
use App\Http\Livewire\Admin\AdminEditHomeSliderComponent;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

// Halaman dashboard (halaman utama)
Route::get('/', HomeComponent::class);

// Halaman shop
Route::get('/shop', ShopComponent::class);

// halaman cart
Route::get('/cart', CartComponent::class)->name('product.cart');

// halaman checkout
Route::get('/checkout', CheckoutComponent::class)->name('checkout');

// halaman daftar wishlist
Route::get('/wishlist',WishlistComponent::class)->name('product.wishlist');

// Halaman thank you untuk setelah pembelian barang
Route::get('/thank-you',ThankyouComponent::class)->name('thankyou');

// Halaman Contact Us
Route::get('/contact-us',ContactComponent::class)->name('contact');

// menampilkan data lengkap produk berdasarkan nama slugnya
Route::get('/product/{slug}', DetailsComponent::class)->name('product.details');

// Menampilkan data produk berdasarkan kategorinya
// Route::get('/product-category/{category_slug}',CategoryComponent::class)->name('product.category');

// Menampilkan data produk berdasarkan kategorinya beserta subcategorynya
Route::get('/product-category/{category_slug}/{scategory_slug?}',CategoryComponent::class)->name('product.category');

// Konfigurasi fitur sistem search
Route::get('/search',SearchComponent::class)->name('product.search');

// Route::middleware([
//     'auth:sanctum',
//     config('jetstream.auth_session'),
//     'verified'
// ])->group(function () {
//     Route::get('/dashboard', function () {
//         return view('dashboard');
//     })->name('dashboard');
// });

// Menampilkan halaman yang di akses setelah login

// Halaman untuk user atau costumer
Route::middleware(['auth:sanctum','verified'])->group(function(){
    Route::get('/user/dashboard',UserDashboardComponent::class)->name('user.dashboard'); // Halaman Dashboard
    // Halaman Order User (Pemesanan untuk pembeli)
    Route::get('/user/orders',UserOrderComponent::class)->name('user.orders'); // Halaman Order
    Route::get('/user/orders/{order_id}',UserOrderDetailsComponent::class)->name('user.orderdetails'); // Halaman detail order
    // Halaman Review Product Order Item
    Route::get('/user/review/{order_item_id}',UserReviewComponent::class)->name('user.review');
    // Halaman User Change Password
    Route::get('/user/change-password',UserChangePasswordComponent::class)->name('user.changepassword');
    // Halaman User Profile
    Route::get('/user/profile',UserProfileComponent::class)->name('user.profile');
    // Halaman User Edit Profile
    Route::get('/user/profile/edit',UserEditProfileComponent::class)->name('user.editprofile');
});

// Halaman untuk admin
Route::middleware(['auth:sanctum','authadmin','verified'])->group(function(){
    Route::get('/admin/dashboard',AdminDashboardComponent::class)->name('admin.dashboard'); // Halaman Dashboard
    // Halaman Menu Category
    Route::get('/admin/categories',AdminCategoryComponent::class)->name('admin.categories'); // Halaman Kategori Produk
    Route::get('/admin/category/add',AdminAddCategoryComponent::class)->name('admin.addcategory'); // Halaman Tambah Data Kategori Produk
    // Route::get('/admin/category/edit/{category_slug}',AdminEditCategoryComponent::class)->name('admin.editcategory'); // Halaman Ubah Data Kategori Produk (jika tidak ada subcategory)
    Route::get('/admin/category/edit/{category_slug}/{scategory_slug?}',AdminEditCategoryComponent::class)->name('admin.editcategory'); // Halaman Ubah Data Kategori Produk
    // Halaman Menu Product
    Route::get('/admin/products',AdminProductComponent::class)->name('admin.products'); // Halaman Produk
    Route::get('/admin/products/add',AdminAddProductComponent::class)->name('admin.addproducts'); // Halaman Tambah Data Produk
    Route::get('/admin/products/edit/{product_slug}',AdminEditProductComponent::class)->name('admin.editproducts'); // Halaman Ubah Data Produk
    // Halaman Admin Slider
    Route::get('/admin/slider',AdminHomeSliderComponent::class)->name('admin.homeslider'); // Halaman Home Slider
    Route::get('/admin/slider/add',AdminAddHomeSliderComponent::class)->name('admin.addhomeslider'); // Halaman Add Home Slider
    Route::get('/admin/slider/edit/{slide_id}',AdminEditHomeSliderComponent::class)->name('admin.edithomeslider'); // Halaman Edit Home Slider
    // Di bagian home menampilkan data product berdasarkan kategorinya
    Route::get('admin/home-categories',AdminHomeCategoryComponent::class)->name('admin.homecategories');
    // Halaman Admin Sale (yang mengatur flash sale diskon barang)
    Route::get('admin/sale',AdminSaleComponent::class)->name('admin.sale');
    // Halaman Admin Coupon diskon
    Route::get('/admin/coupons',AdminCouponsComponent::class)->name('admin.coupons');
    Route::get('/admin/coupon/add',AdminAddCouponComponent::class)->name('admin.addcoupon');
    Route::get('admin/coupon/edit/{coupon_id}',AdminEditCouponComponent::class)->name('admin.editcoupon');
    // Halaman admin order (pesanan)
    Route::get('/admin/orders',AdminOrderComponent::class)->name('admin.orders');
    Route::get('/admin/orders/{order_id}',AdminOrderDetailsComponent::class)->name('admin.orderdetails');
    // Halaman contact admin
    Route::get('/admin/contact-us',AdminContactComponent::class)->name('admin.contact');
    // Halaman Setting admin
    Route::get('/admin/settings',AdminSettingComponent::class)->name('admin.settings');

    Route::get('/admin/attributes',AdminAttributesComponent::class)->name('admin.attributes');
    Route::get('/admin/attribute/add',AdminAddAttributeComponent::class)->name('admin.add_attribute');
    Route::get('/admin/attribute/edit/{attribute_id}',AdminEditAttributeComponent::class)->name('admin.edit_attribute');

});
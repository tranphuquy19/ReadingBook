# Reading Book

```
$ rails new ReadingBook
```
### 1.3.4 Hello, world!

### 2.2 User Resource

#### Tạo mô hình MVC đơn giản sử dụng `scaffold` :
```
$ rails generate scaffold User name:string email:string
```

##### Migrate bảng vào db
```
$ rails db:migrate
```

##### Duyệt các routes
```
$ rails routes
```

##### Start Rails Server
```
$ rails s
```

[Create new user](http://localhost:3000/users/new)

### 2.3.1 A micropost microtour

```
$ rails generate scaffold Micropost content:text user_id:integer
$ rails db:migrate
```
### 3 Mostly static pages

#### 3.1 Sample app setup

#### 3.2.1 Generated static pages

Tạo controllers StaticPages, home, help

```
$ rails generate controller StaticPages home help
```

Controller sẽ tạo ra các view tương ứng với từng controller (html.erb), và không cần render view như các FW khác như Laravel ...

[Go to Home Page](http://localhost:3000/static_pages/home) [Go to Help Page](http://localhost:3000/static_pages/help)

#### 3.4.3 Layouts and embedded Ruby (Refactor)

Đây là thuộc tính quan trọng đối mới mỗi FW (DRY-Don’t Repeat Yourself), hạn chế tối đa việc lặp code ở tầng View. Bằng cách thừa kế (nhúng) thuộc tính View vd như Header, Footer vì chúng đôi khi giống or gần giống ở tất cả các pages.

Chú ý đây không phải là thuộc tính của HTML, html.erb cơ bản cú pháp giống với ruby nhúng HTML, nhưng khi biên dịch thì được convert về  ruby. Vd như các câu lênh ```render html:``` kế tiếp nhau. Đây là lí do tại sao mở rộng của tệp là `.html.erb` chứ không phải `.html`

Trong phần này chúng ta kế thừa từ master layout là `application.html.erb`.
Trong đó: 

```ruby
<%= csrf_meta_tags %> #kỹ thuật phòng chống Cross Site Request Forgery, bằng cách sinh ra các token xác thực ở các form
<%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %> #link stylesheet .css
<%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %> #link javascript .js
```

#### 3.4.4 Setting the root route

### 4 Rails-flavored Ruby

#### 4.1.2 Custom helpers

Một điều tôi thích ở FW Laravel đó là Helper, chúng ta có thể định nghĩa các biến, các hằng, các function (request db, modify giá trị or check Authentication) ở toàn bộ Project hay 1 vùng nào đó. Giúp tránh code đi code lại 1 đoạn code nhàm chán nhưng lại xuất hiện ở mọi nơi. Và tuyệt vời rằng là Rails có hỗ trợ chúng yahoooo! ;)

Xem custom helper [tại đây](https://github.com/tranphuquy19/ReadingBook/commit/2d6dfe675827e8f768ddd61f60d902962b38d1c2) (-commit 2d6dfe6)

### Filling in the layout

#### 5.1.1-5.1.2

Trong phần này tác giả đề cập đến Bootstrap, SASS/SCSS, Font-Awesome. Mình sẽ custom theo cách riêng của mình và sử dụng Boostrap thuần để đơn giản hóa vấn đề và tập trung vào FW. Mình có số từ khóa bạn cần tham khảo cũng như tăng exp của mình như `gulp`, `parcel`, `react`, `vue`, ...
Hoặc bạn có thể đơn giản hóa vấn đề hơn nữa, bạn có thể sử dụng các template có sẵn free trên internet, hỗ trợ đến 99% mà bạn cần giải quyết ở front-end và tập trung vào back-end. Và... cả 2 nếu bạn có thiên hướng Full-stack

#### 5.1.3 Partials

Ngoài Refactor, Rails còn hỗ trợ chúng ta thêm tính năng nữa đó là Partials nhằm chia nhỏ code ra, để dễ kiểm soát, tái sử dụng và tránh nhọc nhằm về code hay mình gọi vui đó là đa kế thừa của html :v

Khi mình gọi `<%= render "layouts/navdropdown"  %>` Rails sẽ hiểu đó là file `_navdropdown.html.erb` nằm trong thư mục `layouts`. Dấu `_` là cách Rails phân biệt 1 Partials với các Views thông thường.

#### 5.4.1 Users controller

`rails generate controller Users new`

### Modeling users

#### 6.1 User model - 6.2.5

```
$ rails generate controller Users new
$ rails db:migrate
```

Sử dụng tag --sandbox trong console để  hoàn nguyên mọi thay đổi trong db khi giao tiếp với db thông qua `rails console`
`rails console --sandbox`

Tạo Migrate `add_index` và migrate:

```
$   rails generate migration add_index_to_users_email
$   rails db:migrate
```
### 6.3 Adding a secure password

#### 6.3.1 A hashed password

Chúng ta sẽ bảo mật thông tin người dùng bằng cách băm mật khẩu (hashed password), thuật toán mình dùng ở đây là BCrypt. Đây là thuật toán khá an toàn, cực kì phổ biến, được các trang lớn sử dụng. Nếu như hacker có thể chiếm quyền Website thậm chí là kiểm soát toàn bộ Database thì việc hacker có thể  khôi phục lại mật khẩu người dùng là cực kì khó, hoặc có thể nói là `mission impossible`
Chúng ta khai báo gem `bcrypt` trong gemfile bằng cách thêm dòng sau 
`gem 'bcrypt', '~> 3.1', '>= 3.1.12'`
Chạy lệnh `$ bundle install` để cài đặt Gems

#### 6.3.2 User has secure password

#### 6.3.3 Minimum password standards

#### 6.3.4 Creating and authenticating a user

### 7. Sign up

#### 7.1.2 A Users resource

Bằng cách khai báo `resources :users` ta đã tạo 1 routes theo chuẩn REST bao gồm cả CRUD(Create, Read, Update, Delete)-tương ứng theo các phương thức POST, GET, PATCH, DELETE

#### 7.1.4 A Gravatar image and a sidebar

Mỗi email chỉ được 1 user duy nhất nên chúng ta sử dụng chuỗi hash từ email này để đặt tên cho file image avatar. Mục đích của việc này ẩn đi filename thật khi user upload avatar của mình lên website. Thứ 2 là tránh các công cụ Crawler craw data website làm ngốn băng thông, quá tải hệ thống, nghiêm trọng hơn là có thể lộ thông tin cá nhân người dùng nếu set filename đơn giản như (00001.jpg, 00002.jpg, ...)

```ruby
gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
```

#### 7.2.2 Signup form HTML

#### 7.3.1 A working form

#### 7.3.2 Strong parameters
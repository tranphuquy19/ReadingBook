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

#### 5.1.1-2

Trong phần này tác giả đề cập đến Bootstrap, SASS/SCSS, Font-Awesome. Mình sẽ custom theo cách riêng của mình và sử dụng Boostrap thuần để đơn giản hóa vấn đề và tập trung vào FW. Mình có số từ khóa bạn cần tham khảo cũng như tăng exp của mình như `gulp`, `parcel`, `react`, `vue`, ...
Hoặc bạn có thể đơn giản hóa vấn đề hơn nữa, bạn có thể sử dụng các template có sẵn free trên internet, hỗ trợ đến 99% mà bạn cần giải quyết ở front-end và tập trung vào back-end. Và... cả 2 nếu bạn có thiên hướng Full-stack
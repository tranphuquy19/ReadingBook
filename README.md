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

### 3.1 Sample app setup

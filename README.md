# rails-module-one2many
> Rails one 2 many.


## step to step:
+ commone with one2one:
```conf
1. 和一对一关联的相似之处是
2. 关联关系也是通过外键建立的。
3. 子对象都会拥有一个父对象的引用，使用belongs_to表示与父对象的关系。
```

+ uncommone with one2one:
```conf
1. 一个父对象对应多个子对象而不是只对应一个。所以需要在父对象中改用has_many引用子对象。
2. 由于has_may个子对象，所以在书写类定义的时候要用复数，这也是符合语言习惯的。
3. 获取子对象的方法不再返回单个子对象，而是返回子对象的列表。方法名字也是复数。
```

+ conditions:
1. A has many B
2. B only belongs to A
3. A是主表，B是从表。
4. A中id的主键值，在B中作为关联用的外键值。
5. 一般来说需要在A、B类中定义对方的引用，以便能够通过一方找到另一方

+ models(Teacher/Course) :
```conf
Teacher has many Course[s]
Course only belongs to Teacher.

So:
A: Teacher
B: Course 

Templates:
rails g model A name:string
rails g B a_id:integer name:string
```

+ create model:
```bash
rails g model Teacher name:string
rails g model Course name:string teacher_id:integer

rake db:migrate
```

## model class:
```rb
# model/teacher.rb
class Teacher < ApplicationRecord
    has_may :courses
end


# model/course.rb
class Course < ApplicationRecord
    belongs_to :teacher
end

# teachers_controller.rb
private
    def teacher_params
        #列举白名单列表
        params.require(:teacher).permit(:name )
    end

# courses_controller.rb
private
    def course_params
        #列举白名单列表
        params.require(:class_room).permit(:name )
    end

```

## seed code:
```rb
t1 = Teacher.create(:name=>"xiaoming")
c1 = Course.create(:name=>"Math");
c2 = Course.create(:name=>"Chinese");

c1.teacher = t1;
c2.teacher = t1;

c1.save
c2.save

t1.courses;
t1.course_ids;
```

## resouces:
+ http://blog.csdn.net/abbuggy/article/details/8274717
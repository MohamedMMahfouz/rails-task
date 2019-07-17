# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all
Comment.destroy_all
Tag.destroy_all

megz = User.create(name: "Megz" , e_mail: "mm@gmail.com",  password: "123456")
ahmed= User.create(name: "Ahmed" , e_mail: "AA@gmail.com",  password: "123456")
amr = User.create(name: "Amr" , e_mail: "Amr@gmail.com",  password: "123456")

p1 = Post.create(content: "post 1 is ready" , user: megz)
p2 = Post.create(content: "post 2 is ready" , user: ahmed)
p3 = Post.create(content: "post 3 is ready" , user: amr)

c1= Comment.create(content: "nice post" , user_id: megz.id , post_id: p1.id)
c2 = Comment.create(content: "amazinggg post" , user_id: ahmed.id , post_id: p2.id)
c3 = Comment.create(content: "coooool" , user_id: amr.id , post_id: p3.id)
c4 = Comment.create(content: "like it!" , user_id: amr.id , post_id: p1.id)

t1 = Tag.create(name: "politics" , post_ids: [p1.id , p2.id])
t2= Tag.create(name: "sports" , post_ids: [p2.id , p3.id])


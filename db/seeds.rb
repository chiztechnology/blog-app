# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Users
#
#first_user = User.create(name: 'Lily Collins', photo: 'https://upload.wikimedia.org/wikipedia/commons/a/a5/Lily_Collins_-_Inside_The_Wardrobe_01.jpg', bio: 'Lily Jane Collins (born 18 March 1989) is a British and American actress. Born in Guildford, Surrey and raised in Los Angeles, California, Collins began performing on screen at the age of two in the BBC sitcom Growing Pains.', posts_counter: 1)
#
#second_user = User.create(name: 'Jennifer Lawrence', photo: 'https://upload.wikimedia.org/wikipedia/commons/5/54/Jennifer_Lawrence_in_2016.jpg', bio: 'Jennifer Shrader Lawrence (born August 15, 1990) is an American actress. The worlds highest-paid actress in 2015 and 2016, her films have grossed over $6 billion worldwide to date.', posts_counter: 2)
#
#third_user = User.create(name: 'Laura Harrier', photo: 'https://upload.wikimedia.org/wikipedia/commons/8/88/Laura_Harrier_Cannes_2018_2.jpg', bio: 'Laura Ruth Harrier (born March 28, 1990) is an American actress and model. She began modeling at the age of 17 after she was discovered by a location scout. She moved to New York City where she continued modeling and was represented by agencies such as IMG Models and Wilhelmina Models.', posts_counter: 1)
#
#Posts
#
#first_post = Post.create(author_id: 1, title: 'About Lily Collins', text: 'Lily Collins is a talented actress and writer who has made a name for herself in the entertainment industry. Born in England, Collins started her career in the early 2000s and has since appeared in a variety of films and TV shows. She is best known for her roles in movies such as "Mirror Mirror," "The Mortal Instruments: City of Bones," and "Rules Dont Apply." In addition to acting, Collins is also an accomplished writer, having penned a memoir titled "Unfiltered: No Shame, No Regrets, Just Me." She continues to be a rising star in Hollywood and is a force to be reckoned with in the industry.', comments_counter: 1, likes_counter: 2)
#
#second_post = Post.create(author_id: 2, title: 'About Jennifer Lawrence 1', text: 'Jennifer Lawrence is a household name in Hollywood, known for her talent and versatility as an actress. She rose to fame with her portrayal of Katniss Everdeen in the Hunger Games franchise, and has since become one of the most sought-after actresses in the industry. Her performances in films such as Silver Linings Playbook, American Hustle, and Joy have earned her critical acclaim and numerous awards. Lawrences down-to-earth personality and relatable demeanor have also made her a fan favorite. With a career that continues to soar, its clear that Jennifer Lawrence is here to stay.', comments_counter: 1, likes_counter: 2)
#
#third_post = Post.create(author_id: 2, title: 'About Jennifer Lawrence 2', text: 'Jennifer Lawrence is not just a talented actress, but also a philanthropist who uses her platform to make a difference in the world. She is an advocate for a number of causes, including gender equality, mental health, and arts education. Lawrence has donated both her time and money to organizations such as the World Food Programme, the Boys & Girls Clubs of America, and the Louisville-based Jennifer Lawrence Foundation. She has also been vocal about her support for the #MeToo movement and has used her influence to speak out against sexual harassment in the entertainment industry. Jennifer Lawrences philanthropic efforts are just one of the many reasons why she is admired by fans and fellow actors alike.', comments_counter: 1, likes_counter: 2)
#
#fourth_post = Post.create(author_id: 3, title: 'About Laura Harrier', text: 'Laura Ruth Harrier (born March 28, 1990) is an American actress and model. She began modeling at the age of 17 after she was discovered by a location scout. She moved to New York City where she continued modeling and was represented by agencies such as IMG Models and Wilhelmina Models. She modeled for various mainstream magazines, appeared in campaigns for Urban Outfitters, Macys and Steve Madden, and was the face of Garnier.', comments_counter: 1, likes_counter: 2)
#
#Comments
#
#first_comment = Comment.create(post_id: 1, author_id: 2, text: 'Great post! Your writing style is very engaging and kept me interested until the end.')
#
#second_comment = Comment.create(post_id: 2, author_id: 1, text: 'Thank you for sharing your valuable insights on this topic. Your ideas are thought-provoking and have given me a new perspective.' )
#
#third_comment = Comment.create(post_id: 3, author_id: 3, text: 'I really appreciate the effort you put into this post. It was well-researched and provided a lot of useful information.')
#
#fourth_comment = Comment.create(post_id: 4, author_id: 1, text: 'You have a talent for explaining complex ideas in a clear and concise manner. Your post was easy to understand and very informative.')
#
#Likes
#
#first_like = Like.create(post_id: 1, author_id: 2)
#
#second_like = Like.create(post_id: 1, author_id: 3)
#
#third_like = Like.create(post_id: 2, author_id: 1)
#
#fourth_like = Like.create(post_id: 2, author_id: 3)
#
#fifth_like = Like.create(post_id: 3, author_id: 1)
#
#sixth_like = Like.create(post_id: 3, author_id: 3)
#
#seventh_like = Like.create(post_id: 4, author_id: 1)
#
#eighth_like = Like.create(post_id: 4, author_id: 2)
Use MAX_STATIC_DATA of 500000.
When play begins, seed the random-number generator with 1234.

container is a kind of thing.
door is a kind of thing.
object-like is a kind of thing.
supporter is a kind of thing.
food is a kind of object-like.
key is a kind of object-like.
containers are openable, lockable and fixed in place. containers are usually closed.
door is openable and lockable.
object-like is portable.
supporters are fixed in place.
food is edible.
A room has a text called internal name.


The r_0 and the r_1 and the r_12 and the r_10 and the r_11 and the r_7 and the r_17 and the r_16 and the r_19 and the r_18 and the r_2 and the r_5 and the r_3 and the r_4 and the r_13 and the r_6 and the r_9 and the r_14 and the r_15 and the r_8 are rooms.

Understand "study" as r_0.
The internal name of r_0 is "study".
The printed name of r_0 is "-= Study =-".
The study part 0 is some text that varies. The study part 0 is "You've entered a study.



You need an unguarded exit? You should try going east. There is an exit to the north. Don't worry, it is unguarded. There is an unguarded exit to the west.".
The description of r_0 is "[study part 0]".

The r_1 is mapped west of r_0.
The r_6 is mapped north of r_0.
The r_10 is mapped east of r_0.
Understand "laundromat" as r_1.
The internal name of r_1 is "laundromat".
The printed name of r_1 is "-= Laundromat =-".
The laundromat part 0 is some text that varies. The laundromat part 0 is "You find yourself in a laundromat. A normal one.



 There is [if d_8 is open]an open[otherwise]a closed[end if]".
The laundromat part 1 is some text that varies. The laundromat part 1 is " passageway leading north. You need an unguarded exit? You should try going east. You don't like doors? Why not try going west, that entranceway is unblocked.".
The description of r_1 is "[laundromat part 0][laundromat part 1]".

The r_12 is mapped west of r_1.
north of r_1 and south of r_2 is a door called d_8.
The r_0 is mapped east of r_1.
Understand "washroom" as r_12.
The internal name of r_12 is "washroom".
The printed name of r_12 is "-= Washroom =-".
The washroom part 0 is some text that varies. The washroom part 0 is "You find yourself in a washroom. A typical one.



You need an unguarded exit? You should try going east.".
The description of r_12 is "[washroom part 0]".

The r_1 is mapped east of r_12.
Understand "chamber" as r_10.
The internal name of r_10 is "chamber".
The printed name of r_10 is "-= Chamber =-".
The chamber part 0 is some text that varies. The chamber part 0 is "You find yourself in a chamber. A normal one.

 Oh, great. Here's a trunk.[if c_0 is open and there is something in the c_0] The trunk contains [a list of things in the c_0]. There's something strange about this thing being here, but you don't have time to worry about that now.[end if]".
The chamber part 1 is some text that varies. The chamber part 1 is "[if c_0 is open and the c_0 contains nothing] The trunk is empty! What a waste of a day![end if]".
The chamber part 2 is some text that varies. The chamber part 2 is "

There is an unguarded exit to the north. There is an unblocked exit to the west.".
The description of r_10 is "[chamber part 0][chamber part 1][chamber part 2]".

The r_0 is mapped west of r_10.
The r_9 is mapped north of r_10.
Understand "spare room" as r_11.
The internal name of r_11 is "spare room".
The printed name of r_11 is "-= Spare Room =-".
The spare room part 0 is some text that varies. The spare room part 0 is "Well how about that, you are in the place we're calling the spare room.



You don't like doors? Why not try going south, that entranceway is unguarded. You don't like doors? Why not try going west, that entranceway is unblocked.".
The description of r_11 is "[spare room part 0]".

The r_7 is mapped west of r_11.
The r_9 is mapped south of r_11.
Understand "bedchamber" as r_7.
The internal name of r_7 is "bedchamber".
The printed name of r_7 is "-= Bedchamber =-".
The bedchamber part 0 is some text that varies. The bedchamber part 0 is "Ah, the bedchamber. This is some kind of bedchamber, really great typical vibes in this place, a wonderful typical atmosphere. The room seems oddly familiar, as though it were only superficially different from the other rooms in the building.

 You lean against the wall, inadvertently pressing a secret button. The wall opens up to reveal a locker.[if c_1 is open and there is something in the c_1] The locker contains [a list of things in the c_1].[end if]".
The bedchamber part 1 is some text that varies. The bedchamber part 1 is "[if c_1 is open and the c_1 contains nothing] The locker is empty! What a waste of a day![end if]".
The bedchamber part 2 is some text that varies. The bedchamber part 2 is " You see a shelf. The shelf is ordinary.[if there is something on the s_0] On the shelf you make out [a list of things on the s_0].[end if]".
The bedchamber part 3 is some text that varies. The bedchamber part 3 is "[if there is nothing on the s_0] But the thing is empty.[end if]".
The bedchamber part 4 is some text that varies. The bedchamber part 4 is "

 There is [if d_6 is open]an open[otherwise]a closed[end if]".
The bedchamber part 5 is some text that varies. The bedchamber part 5 is " wooden passageway leading west. There is an unguarded exit to the east. There is an unguarded exit to the north. There is an unguarded exit to the south.".
The description of r_7 is "[bedchamber part 0][bedchamber part 1][bedchamber part 2][bedchamber part 3][bedchamber part 4][bedchamber part 5]".

west of r_7 and east of r_3 is a door called d_6.
The r_6 is mapped south of r_7.
The r_8 is mapped north of r_7.
The r_11 is mapped east of r_7.
Understand "bar" as r_17.
The internal name of r_17 is "bar".
The printed name of r_17 is "-= Bar =-".
The bar part 0 is some text that varies. The bar part 0 is "Well how about that, you are in the place we're calling the bar.



 There is [if d_2 is open]an open[otherwise]a closed[end if]".
The bar part 1 is some text that varies. The bar part 1 is " gateway leading south. There is [if d_3 is open]an open[otherwise]a closed[end if]".
The bar part 2 is some text that varies. The bar part 2 is " gate leading west.".
The description of r_17 is "[bar part 0][bar part 1][bar part 2]".

west of r_17 and east of r_16 is a door called d_3.
south of r_17 and north of r_18 is a door called d_2.
Understand "attic" as r_16.
The internal name of r_16 is "attic".
The printed name of r_16 is "-= Attic =-".
The attic part 0 is some text that varies. The attic part 0 is "You've just shown up in an attic. You try to gain information on your surroundings by using a technique you call 'looking.'

 You see a safe.[if c_2 is open and there is something in the c_2] The safe contains [a list of things in the c_2].[end if]".
The attic part 1 is some text that varies. The attic part 1 is "[if c_2 is open and the c_2 contains nothing] What a letdown! The safe is empty![end if]".
The attic part 2 is some text that varies. The attic part 2 is " You see a table. [if there is something on the s_1]On the table you can make out [a list of things on the s_1]. Suddenly, you bump your head on the ceiling, but it's not such a bad bump that it's going to prevent you from looking at objects and even things.[end if]".
The attic part 3 is some text that varies. The attic part 3 is "[if there is nothing on the s_1]But the thing is empty, unfortunately.[end if]".
The attic part 4 is some text that varies. The attic part 4 is "

 There is [if d_3 is open]an open[otherwise]a closed[end if]".
The attic part 5 is some text that varies. The attic part 5 is " gate leading east. There is [if d_4 is open]an open[otherwise]a closed[end if]".
The attic part 6 is some text that varies. The attic part 6 is " hatch leading south.".
The description of r_16 is "[attic part 0][attic part 1][attic part 2][attic part 3][attic part 4][attic part 5][attic part 6]".

south of r_16 and north of r_15 is a door called d_4.
east of r_16 and west of r_17 is a door called d_3.
Understand "basement" as r_19.
The internal name of r_19 is "basement".
The printed name of r_19 is "-= Basement =-".
The basement part 0 is some text that varies. The basement part 0 is "You are in a basement. A typical one. You can barely contain your excitement.



You don't like doors? Why not try going west, that entranceway is unguarded.".
The description of r_19 is "[basement part 0]".

The r_18 is mapped west of r_19.
Understand "launderette" as r_18.
The internal name of r_18 is "launderette".
The printed name of r_18 is "-= Launderette =-".
The launderette part 0 is some text that varies. The launderette part 0 is "You are in a launderette. A standard one.

 You can make out [if c_3 is locked]a locked[else if c_3 is open]an opened[otherwise]a closed[end if]".
The launderette part 1 is some text that varies. The launderette part 1 is " drawer nearby.[if c_3 is open and there is something in the c_3] The drawer contains [a list of things in the c_3].[end if]".
The launderette part 2 is some text that varies. The launderette part 2 is "[if c_3 is open and the c_3 contains nothing] Empty! What kind of nightmare TextWorld is this?[end if]".
The launderette part 3 is some text that varies. The launderette part 3 is "

 There is [if d_2 is open]an open[otherwise]a closed[end if]".
The launderette part 4 is some text that varies. The launderette part 4 is " gateway leading north. There is an unblocked exit to the east.".
The description of r_18 is "[launderette part 0][launderette part 1][launderette part 2][launderette part 3][launderette part 4]".

north of r_18 and south of r_17 is a door called d_2.
The r_19 is mapped east of r_18.
Understand "kitchenette" as r_2.
The internal name of r_2 is "kitchenette".
The printed name of r_2 is "-= Kitchenette =-".
The kitchenette part 0 is some text that varies. The kitchenette part 0 is "You find yourself in a kitchenette. A normal one. You begin to take stock of what's here.

 You see a refrigerator. There's something strange about this thing being here, but you don't have time to worry about that now.[if c_4 is open and there is something in the c_4] The refrigerator contains [a list of things in the c_4]. Is this what you came to TextWorld for? This... refrigerator?[end if]".
The kitchenette part 1 is some text that varies. The kitchenette part 1 is "[if c_4 is open and the c_4 contains nothing] Empty! What kind of nightmare TextWorld is this?[end if]".
The kitchenette part 2 is some text that varies. The kitchenette part 2 is " You can make out a board. Now why would someone leave that there? The board is normal.[if there is something on the s_2] On the board you see [a list of things on the s_2].[end if]".
The kitchenette part 3 is some text that varies. The kitchenette part 3 is "[if there is nothing on the s_2] But there isn't a thing on it.[end if]".
The kitchenette part 4 is some text that varies. The kitchenette part 4 is "

 There is [if d_7 is open]an open[otherwise]a closed[end if]".
The kitchenette part 5 is some text that varies. The kitchenette part 5 is " door leading north. There is [if d_8 is open]an open[otherwise]a closed[end if]".
The kitchenette part 6 is some text that varies. The kitchenette part 6 is " passageway leading south. There is an unguarded exit to the east. You don't like doors? Why not try going west, that entranceway is unblocked.".
The description of r_2 is "[kitchenette part 0][kitchenette part 1][kitchenette part 2][kitchenette part 3][kitchenette part 4][kitchenette part 5][kitchenette part 6]".

The r_5 is mapped west of r_2.
south of r_2 and north of r_1 is a door called d_8.
north of r_2 and south of r_3 is a door called d_7.
The r_6 is mapped east of r_2.
Understand "workshop" as r_5.
The internal name of r_5 is "workshop".
The printed name of r_5 is "-= Workshop =-".
The workshop part 0 is some text that varies. The workshop part 0 is "You find yourself in a workshop. A standard kind of place.

 You see a case. I mean, just wow! Isn't TextWorld just the best?[if c_5 is open and there is something in the c_5] The case contains [a list of things in the c_5].[end if]".
The workshop part 1 is some text that varies. The workshop part 1 is "[if c_5 is open and the c_5 contains nothing] Empty! What kind of nightmare TextWorld is this?[end if]".
The workshop part 2 is some text that varies. The workshop part 2 is "

There is an unblocked exit to the east.".
The description of r_5 is "[workshop part 0][workshop part 1][workshop part 2]".

The r_2 is mapped east of r_5.
Understand "shower" as r_3.
The internal name of r_3 is "shower".
The printed name of r_3 is "-= Shower =-".
The shower part 0 is some text that varies. The shower part 0 is "You arrive in a shower. A typical kind of place.

 You make out [if c_6 is locked]a locked[else if c_6 is open]an opened[otherwise]a closed[end if]".
The shower part 1 is some text that varies. The shower part 1 is " cabinet.[if c_6 is open and there is something in the c_6] The cabinet contains [a list of things in the c_6]. You check the price tag on the cabinet. Eighty dollars?! That's ridiculous! You know, I know a friend who could get you one of those for 20 bucks![end if]".
The shower part 2 is some text that varies. The shower part 2 is "[if c_6 is open and the c_6 contains nothing] What a letdown! The cabinet is empty![end if]".
The shower part 3 is some text that varies. The shower part 3 is " Oh wow! Is that what I think it is? It is! It's a rack. [if there is something on the s_3]On the rack you make out [a list of things on the s_3].[end if]".
The shower part 4 is some text that varies. The shower part 4 is "[if there is nothing on the s_3]Looks like someone's already been here and taken everything off it, though. What, you think everything in TextWorld should have stuff on it?[end if]".
The shower part 5 is some text that varies. The shower part 5 is "

 There is [if d_6 is open]an open[otherwise]a closed[end if]".
The shower part 6 is some text that varies. The shower part 6 is " wooden passageway leading east. There is [if d_7 is open]an open[otherwise]a closed[end if]".
The shower part 7 is some text that varies. The shower part 7 is " door leading south. There is [if d_5 is open]an open[otherwise]a closed[end if]".
The shower part 8 is some text that varies. The shower part 8 is " mahogany gateway leading west.".
The description of r_3 is "[shower part 0][shower part 1][shower part 2][shower part 3][shower part 4][shower part 5][shower part 6][shower part 7][shower part 8]".

west of r_3 and east of r_4 is a door called d_5.
south of r_3 and north of r_2 is a door called d_7.
east of r_3 and west of r_7 is a door called d_6.
Understand "cookery" as r_4.
The internal name of r_4 is "cookery".
The printed name of r_4 is "-= Cookery =-".
The cookery part 0 is some text that varies. The cookery part 0 is "You are in a cookery. An usual one.

 Oh wow! Is that what I think it is? It is! It's a bowl. [if there is something on the s_4]You see [a list of things on the s_4] on the bowl. Huh, weird.[end if]".
The cookery part 1 is some text that varies. The cookery part 1 is "[if there is nothing on the s_4]But oh no! there's nothing on this piece of garbage.[end if]".
The cookery part 2 is some text that varies. The cookery part 2 is " You make out a counter. You wonder idly who left that here. [if there is something on the s_5]You see [a list of things on the s_5] on the counter.[end if]".
The cookery part 3 is some text that varies. The cookery part 3 is "[if there is nothing on the s_5]Looks like someone's already been here and taken everything off it, though.[end if]".
The cookery part 4 is some text that varies. The cookery part 4 is " You can make out a pan. [if there is something on the s_6]You see [a list of things on the s_6] on the pan.[end if]".
The cookery part 5 is some text that varies. The cookery part 5 is "[if there is nothing on the s_6]Looks like someone's already been here and taken everything off it, though. What, you think everything in TextWorld should have stuff on it?[end if]".
The cookery part 6 is some text that varies. The cookery part 6 is "

 There is [if d_1 is open]an open[otherwise]a closed[end if]".
The cookery part 7 is some text that varies. The cookery part 7 is " type 7 portal leading west. There is [if d_5 is open]an open[otherwise]a closed[end if]".
The cookery part 8 is some text that varies. The cookery part 8 is " mahogany gateway leading east.".
The description of r_4 is "[cookery part 0][cookery part 1][cookery part 2][cookery part 3][cookery part 4][cookery part 5][cookery part 6][cookery part 7][cookery part 8]".

west of r_4 and east of r_13 is a door called d_1.
east of r_4 and west of r_3 is a door called d_5.
Understand "salon" as r_13.
The internal name of r_13 is "salon".
The printed name of r_13 is "-= Salon =-".
The salon part 0 is some text that varies. The salon part 0 is "You arrive in a salon. A standard one.

 You can make out [if c_7 is locked]a locked[else if c_7 is open]an opened[otherwise]a closed[end if]".
The salon part 1 is some text that varies. The salon part 1 is " dresser, which looks normal, right there by you.[if c_7 is open and there is something in the c_7] The dresser contains [a list of things in the c_7].[end if]".
The salon part 2 is some text that varies. The salon part 2 is "[if c_7 is open and the c_7 contains nothing] Empty! What kind of nightmare TextWorld is this?[end if]".
The salon part 3 is some text that varies. The salon part 3 is "

 There is [if d_1 is open]an open[otherwise]a closed[end if]".
The salon part 4 is some text that varies. The salon part 4 is " type 7 portal leading east. There is [if d_0 is open]an open[otherwise]a closed[end if]".
The salon part 5 is some text that varies. The salon part 5 is " portal leading north. There is an unblocked exit to the south.".
The description of r_13 is "[salon part 0][salon part 1][salon part 2][salon part 3][salon part 4][salon part 5]".

The r_14 is mapped south of r_13.
north of r_13 and south of r_15 is a door called d_0.
east of r_13 and west of r_4 is a door called d_1.
Understand "canteen" as r_6.
The internal name of r_6 is "canteen".
The printed name of r_6 is "-= Canteen =-".
The canteen part 0 is some text that varies. The canteen part 0 is "I never took you for the sort of person who would show up in a canteen, but I guess I was wrong.

 You make out [if c_8 is locked]a locked[else if c_8 is open]an opened[otherwise]a closed[end if]".
The canteen part 1 is some text that varies. The canteen part 1 is " fridge.[if c_8 is open and there is something in the c_8] The fridge contains [a list of things in the c_8].[end if]".
The canteen part 2 is some text that varies. The canteen part 2 is "[if c_8 is open and the c_8 contains nothing] The fridge is empty, what a horrible day![end if]".
The canteen part 3 is some text that varies. The canteen part 3 is "

You need an unblocked exit? You should try going east. There is an exit to the north. Don't worry, it is unguarded. There is an exit to the south. Don't worry, it is unguarded. There is an unguarded exit to the west.".
The description of r_6 is "[canteen part 0][canteen part 1][canteen part 2][canteen part 3]".

The r_2 is mapped west of r_6.
The r_0 is mapped south of r_6.
The r_7 is mapped north of r_6.
The r_9 is mapped east of r_6.
Understand "playroom" as r_9.
The internal name of r_9 is "playroom".
The printed name of r_9 is "-= Playroom =-".
The playroom part 0 is some text that varies. The playroom part 0 is "You arrive in a playroom. A typical one.

 If you haven't noticed it already, there seems to be something there by the wall, it's a basket.[if c_9 is open and there is something in the c_9] The basket contains [a list of things in the c_9].[end if]".
The playroom part 1 is some text that varies. The playroom part 1 is "[if c_9 is open and the c_9 contains nothing] The basket is empty! What a waste of a day![end if]".
The playroom part 2 is some text that varies. The playroom part 2 is "

There is an exit to the north. Don't worry, it is unblocked. You don't like doors? Why not try going south, that entranceway is unblocked. There is an exit to the west. Don't worry, it is unblocked.".
The description of r_9 is "[playroom part 0][playroom part 1][playroom part 2]".

The r_6 is mapped west of r_9.
The r_10 is mapped south of r_9.
The r_11 is mapped north of r_9.
Understand "office" as r_14.
The internal name of r_14 is "office".
The printed name of r_14 is "-= Office =-".
The office part 0 is some text that varies. The office part 0 is "You've entered an office.

 As if things weren't amazing enough already, you can even see a bureau. Is this it? Is this what you came to TextWorld to see? a bureau?[if c_10 is open and there is something in the c_10] The bureau contains [a list of things in the c_10].[end if]".
The office part 1 is some text that varies. The office part 1 is "[if c_10 is open and the c_10 contains nothing] The bureau is empty, what a horrible day![end if]".
The office part 2 is some text that varies. The office part 2 is "

There is an unguarded exit to the north.".
The description of r_14 is "[office part 0][office part 1][office part 2]".

The r_13 is mapped north of r_14.
Understand "garage" as r_15.
The internal name of r_15 is "garage".
The printed name of r_15 is "-= Garage =-".
The garage part 0 is some text that varies. The garage part 0 is "You arrive in a garage. A standard kind of place.

 Oh wow! Is that what I think it is? It is! It's a stand. [if there is something on the s_7]On the stand you see [a list of things on the s_7]. Wow! Just like in the movies![end if]".
The garage part 1 is some text that varies. The garage part 1 is "[if there is nothing on the s_7]The stand appears to be empty.[end if]".
The garage part 2 is some text that varies. The garage part 2 is "

 There is [if d_4 is open]an open[otherwise]a closed[end if]".
The garage part 3 is some text that varies. The garage part 3 is " hatch leading north. There is [if d_0 is open]an open[otherwise]a closed[end if]".
The garage part 4 is some text that varies. The garage part 4 is " portal leading south.".
The description of r_15 is "[garage part 0][garage part 1][garage part 2][garage part 3][garage part 4]".

south of r_15 and north of r_13 is a door called d_0.
north of r_15 and south of r_16 is a door called d_4.
Understand "vault" as r_8.
The internal name of r_8 is "vault".
The printed name of r_8 is "-= Vault =-".
The vault part 0 is some text that varies. The vault part 0 is "Well, here we are in a vault.

 You can see a workbench. [if there is something on the s_8]You see [a list of things on the s_8] on the workbench.[end if]".
The vault part 1 is some text that varies. The vault part 1 is "[if there is nothing on the s_8]However, the workbench, like an empty workbench, has nothing on it. It would have been so cool if there was stuff on the workbench.[end if]".
The vault part 2 is some text that varies. The vault part 2 is "

There is an exit to the south. Don't worry, it is unblocked.".
The description of r_8 is "[vault part 0][vault part 1][vault part 2]".

The r_7 is mapped south of r_8.

The c_0 and the c_1 and the c_10 and the c_2 and the c_3 and the c_4 and the c_5 and the c_6 and the c_7 and the c_8 and the c_9 are containers.
The c_0 and the c_1 and the c_10 and the c_2 and the c_3 and the c_4 and the c_5 and the c_6 and the c_7 and the c_8 and the c_9 are privately-named.
The d_8 and the d_0 and the d_1 and the d_4 and the d_3 and the d_2 and the d_7 and the d_5 and the d_6 are doors.
The d_8 and the d_0 and the d_1 and the d_4 and the d_3 and the d_2 and the d_7 and the d_5 and the d_6 are privately-named.
The f_0 are foods.
The f_0 are privately-named.
The k_0 and the k_1 are keys.
The k_0 and the k_1 are privately-named.
The r_0 and the r_1 and the r_12 and the r_10 and the r_11 and the r_7 and the r_17 and the r_16 and the r_19 and the r_18 and the r_2 and the r_5 and the r_3 and the r_4 and the r_13 and the r_6 and the r_9 and the r_14 and the r_15 and the r_8 are rooms.
The r_0 and the r_1 and the r_12 and the r_10 and the r_11 and the r_7 and the r_17 and the r_16 and the r_19 and the r_18 and the r_2 and the r_5 and the r_3 and the r_4 and the r_13 and the r_6 and the r_9 and the r_14 and the r_15 and the r_8 are privately-named.
The s_0 and the s_1 and the s_2 and the s_3 and the s_4 and the s_5 and the s_6 and the s_7 and the s_8 are supporters.
The s_0 and the s_1 and the s_2 and the s_3 and the s_4 and the s_5 and the s_6 and the s_7 and the s_8 are privately-named.

The description of d_8 is "it is what it is, a passageway [if open]It is open.[else if closed]It is closed.[otherwise]It is locked.[end if]".
The printed name of d_8 is "passageway".
Understand "passageway" as d_8.
The d_8 is open.
The description of d_0 is "The portal looks manageable. [if open]You can see inside it.[else if closed]You can't see inside it because the lid's in your way.[otherwise]There is a lock on it.[end if]".
The printed name of d_0 is "portal".
Understand "portal" as d_0.
The d_0 is open.
The description of d_1 is "it's a commanding type 7 portal [if open]It is open.[else if closed]It is closed.[otherwise]It is locked.[end if]".
The printed name of d_1 is "type 7 portal".
Understand "type 7 portal" as d_1.
Understand "type" as d_1.
Understand "7" as d_1.
Understand "portal" as d_1.
The d_1 is locked.
The description of d_4 is "The hatch looks sturdy. [if open]It is open.[else if closed]It is closed.[otherwise]It is locked.[end if]".
The printed name of d_4 is "hatch".
Understand "hatch" as d_4.
The d_4 is open.
The description of d_3 is "it's a robust gate [if open]You can see inside it.[else if closed]You can't see inside it because the lid's in your way.[otherwise]There is a lock on it.[end if]".
The printed name of d_3 is "gate".
Understand "gate" as d_3.
The d_3 is open.
The description of d_2 is "it is what it is, a gateway [if open]You can see inside it.[else if closed]You can't see inside it because the lid's in your way.[otherwise]There is a lock on it.[end if]".
The printed name of d_2 is "gateway".
Understand "gateway" as d_2.
The d_2 is open.
The description of d_7 is "it's a towering door [if open]You can see inside it.[else if closed]You can't see inside it because the lid's in your way.[otherwise]There is a lock on it.[end if]".
The printed name of d_7 is "door".
Understand "door" as d_7.
The d_7 is open.
The description of d_5 is "it's an ominous gateway [if open]You can see inside it.[else if closed]You can't see inside it because the lid's in your way.[otherwise]There is a lock on it.[end if]".
The printed name of d_5 is "mahogany gateway".
Understand "mahogany gateway" as d_5.
Understand "mahogany" as d_5.
Understand "gateway" as d_5.
The d_5 is open.
The description of d_6 is "it's a commanding passageway [if open]You can see inside it.[else if closed]You can't see inside it because the lid's in your way.[otherwise]There is a lock on it.[end if]".
The printed name of d_6 is "wooden passageway".
Understand "wooden passageway" as d_6.
Understand "wooden" as d_6.
Understand "passageway" as d_6.
The d_6 is open.
The description of c_0 is "The trunk looks strong, and impossible to destroy. [if open]It is open.[else if closed]It is closed.[otherwise]It is locked.[end if]".
The printed name of c_0 is "trunk".
Understand "trunk" as c_0.
The c_0 is in r_10.
The c_0 is locked.
The description of c_1 is "The locker looks strong, and impossible to break. [if open]You can see inside it.[else if closed]You can't see inside it because the lid's in your way.[otherwise]There is a lock on it.[end if]".
The printed name of c_1 is "locker".
Understand "locker" as c_1.
The c_1 is in r_7.
The c_1 is closed.
The description of c_10 is "The bureau looks strong, and impossible to break. [if open]You can see inside it.[else if closed]You can't see inside it because the lid's in your way.[otherwise]There is a lock on it.[end if]".
The printed name of c_10 is "bureau".
Understand "bureau" as c_10.
The c_10 is in r_14.
The c_10 is closed.
The description of c_2 is "The safe looks strong, and impossible to break. [if open]You can see inside it.[else if closed]You can't see inside it because the lid's in your way.[otherwise]There is a lock on it.[end if]".
The printed name of c_2 is "safe".
Understand "safe" as c_2.
The c_2 is in r_16.
The c_2 is locked.
The description of c_3 is "The drawer looks strong, and impossible to crack. [if open]It is open.[else if closed]It is closed.[otherwise]It is locked.[end if]".
The printed name of c_3 is "drawer".
Understand "drawer" as c_3.
The c_3 is in r_18.
The c_3 is locked.
The description of c_4 is "The refrigerator looks strong, and impossible to crack. [if open]It is open.[else if closed]It is closed.[otherwise]It is locked.[end if]".
The printed name of c_4 is "refrigerator".
Understand "refrigerator" as c_4.
The c_4 is in r_2.
The c_4 is locked.
The description of c_5 is "The case looks strong, and impossible to break. [if open]You can see inside it.[else if closed]You can't see inside it because the lid's in your way.[otherwise]There is a lock on it.[end if]".
The printed name of c_5 is "case".
Understand "case" as c_5.
The c_5 is in r_5.
The c_5 is locked.
The description of c_6 is "The cabinet looks strong, and impossible to break. [if open]You can see inside it.[else if closed]You can't see inside it because the lid's in your way.[otherwise]There is a lock on it.[end if]".
The printed name of c_6 is "cabinet".
Understand "cabinet" as c_6.
The c_6 is in r_3.
The c_6 is open.
The description of c_7 is "The dresser looks strong, and impossible to crack. [if open]It is open.[else if closed]It is closed.[otherwise]It is locked.[end if]".
The printed name of c_7 is "dresser".
Understand "dresser" as c_7.
The c_7 is in r_13.
The c_7 is open.
The description of c_8 is "The fridge looks strong, and impossible to crack. [if open]You can see inside it.[else if closed]You can't see inside it because the lid's in your way.[otherwise]There is a lock on it.[end if]".
The printed name of c_8 is "fridge".
Understand "fridge" as c_8.
The c_8 is in r_6.
The c_8 is open.
The description of c_9 is "The basket looks strong, and impossible to destroy. [if open]You can see inside it.[else if closed]You can't see inside it because the lid's in your way.[otherwise]There is a lock on it.[end if]".
The printed name of c_9 is "basket".
Understand "basket" as c_9.
The c_9 is in r_9.
The c_9 is locked.
The description of f_0 is "The pizza looks delectable.".
The printed name of f_0 is "pizza".
Understand "pizza" as f_0.
The f_0 is in r_14.
The description of k_0 is "The passkey is cold to the touch".
The printed name of k_0 is "passkey".
Understand "passkey" as k_0.
The k_0 is in r_12.
The description of s_0 is "The shelf is reliable.".
The printed name of s_0 is "shelf".
Understand "shelf" as s_0.
The s_0 is in r_7.
The description of s_1 is "The table is solidly built.".
The printed name of s_1 is "table".
Understand "table" as s_1.
The s_1 is in r_16.
The description of s_2 is "The board is balanced.".
The printed name of s_2 is "board".
Understand "board" as s_2.
The s_2 is in r_2.
The description of s_3 is "The rack is balanced.".
The printed name of s_3 is "rack".
Understand "rack" as s_3.
The s_3 is in r_3.
The description of s_4 is "The bowl is solidly built.".
The printed name of s_4 is "bowl".
Understand "bowl" as s_4.
The s_4 is in r_4.
The description of s_5 is "The counter is reliable.".
The printed name of s_5 is "counter".
Understand "counter" as s_5.
The s_5 is in r_4.
The description of s_6 is "The pan is reliable.".
The printed name of s_6 is "pan".
Understand "pan" as s_6.
The s_6 is in r_4.
The description of s_7 is "The stand is shaky.".
The printed name of s_7 is "stand".
Understand "stand" as s_7.
The s_7 is in r_15.
The description of s_8 is "The workbench is undependable.".
The printed name of s_8 is "workbench".
Understand "workbench" as s_8.
The s_8 is in r_8.
The description of k_1 is "The type 7 keycard is cold to the touch".
The printed name of k_1 is "type 7 keycard".
Understand "type 7 keycard" as k_1.
Understand "type" as k_1.
Understand "7" as k_1.
Understand "keycard" as k_1.
The player carries the k_1.
The matching key of the d_1 is the k_1.


The player is in r_4.

The quest0 completed is a truth state that varies.
The quest0 completed is usually false.

Test quest0_0 with "unlock type 7 portal with type 7 keycard / open type 7 portal / go west / go south / take pizza"

Every turn:
	if quest0 completed is true:
		do nothing;
	else if The player carries the k_0:
		end the story; [Lost]
	else if The player is in r_14 and The player carries the f_0:
		increase the score by 1; [Quest completed]
		if 1 is 1 [always true]:
			Now the quest0 completed is true;

Use scoring. The maximum score is 1.
This is the simpler notify score changes rule:
	If the score is not the last notified score:
		let V be the score - the last notified score;
		if V > 0:
			say "Your score has just gone up by [V in words] ";
		else:
			say "Your score changed by [V in words] ";
		if V >= -1 and V <= 1:
			say "point.";
		else:
			say "points.";
		Now the last notified score is the score;
	if quest0 completed is true:
		end the story finally; [Win]

The simpler notify score changes rule substitutes for the notify score changes rule.

Rule for listing nondescript items:
	stop.

Rule for printing the banner text:
	say "[fixed letter spacing]";
	say "                    ________  ________  __    __  ________        [line break]";
	say "                   |        \|        \|  \  |  \|        \       [line break]";
	say "                    \$$$$$$$$| $$$$$$$$| $$  | $$ \$$$$$$$$       [line break]";
	say "                      | $$   | $$__     \$$\/  $$   | $$          [line break]";
	say "                      | $$   | $$  \     >$$  $$    | $$          [line break]";
	say "                      | $$   | $$$$$    /  $$$$\    | $$          [line break]";
	say "                      | $$   | $$_____ |  $$ \$$\   | $$          [line break]";
	say "                      | $$   | $$     \| $$  | $$   | $$          [line break]";
	say "                       \$$    \$$$$$$$$ \$$   \$$    \$$          [line break]";
	say "              __       __   ______   _______   __        _______  [line break]";
	say "             |  \  _  |  \ /      \ |       \ |  \      |       \ [line break]";
	say "             | $$ / \ | $$|  $$$$$$\| $$$$$$$\| $$      | $$$$$$$\[line break]";
	say "             | $$/  $\| $$| $$  | $$| $$__| $$| $$      | $$  | $$[line break]";
	say "             | $$  $$$\ $$| $$  | $$| $$    $$| $$      | $$  | $$[line break]";
	say "             | $$ $$\$$\$$| $$  | $$| $$$$$$$\| $$      | $$  | $$[line break]";
	say "             | $$$$  \$$$$| $$__/ $$| $$  | $$| $$_____ | $$__/ $$[line break]";
	say "             | $$$    \$$$ \$$    $$| $$  | $$| $$     \| $$    $$[line break]";
	say "              \$$      \$$  \$$$$$$  \$$   \$$ \$$$$$$$$ \$$$$$$$ [line break]";
	say "[variable letter spacing][line break]";
	say "[objective][line break]".

Include Basic Screen Effects by Emily Short.

Rule for printing the player's obituary:
	if story has ended finally:
		center "*** The End ***";
	else:
		center "*** You lost! ***";
	say paragraph break;
	if maximum score is -32768:
		say "You scored a total of [score] point[s], in [turn count] turn[s].";
	else:
		say "You scored [score] out of a possible [maximum score], in [turn count] turn[s].";
	[wait for any key;
	stop game abruptly;]
	rule succeeds.

Carry out requesting the score:
	if maximum score is -32768:
		say "You have so far scored [score] point[s], in [turn count] turn[s].";
	else:
		say "You have so far scored [score] out of a possible [maximum score], in [turn count] turn[s].";
	rule succeeds.

Rule for implicitly taking something (called target):
	if target is fixed in place:
		say "The [target] is fixed in place.";
	otherwise:
		say "You need to take the [target] first.";
		set pronouns from target;
	stop.

Does the player mean doing something:
	if the noun is not nothing and the second noun is nothing and the player's command matches the text printed name of the noun:
		it is likely;
	if the noun is nothing and the second noun is not nothing and the player's command matches the text printed name of the second noun:
		it is likely;
	if the noun is not nothing and the second noun is not nothing and the player's command matches the text printed name of the noun and the player's command matches the text printed name of the second noun:
		it is very likely.  [Handle action with two arguments.]

Printing the content of the room is an activity.
Rule for printing the content of the room:
	let R be the location of the player;
	say "Room contents:[line break]";
	list the contents of R, with newlines, indented, including all contents, with extra indentation.

Printing the content of the world is an activity.
Rule for printing the content of the world:
	let L be the list of the rooms;
	say "World: [line break]";
	repeat with R running through L:
		say "  [the internal name of R][line break]";
	repeat with R running through L:
		say "[the internal name of R]:[line break]";
		if the list of things in R is empty:
			say "  nothing[line break]";
		otherwise:
			list the contents of R, with newlines, indented, including all contents, with extra indentation.

Printing the content of the inventory is an activity.
Rule for printing the content of the inventory:
	say "You are carrying: ";
	list the contents of the player, as a sentence, giving inventory information, including all contents;
	say ".".

The print standard inventory rule is not listed in any rulebook.
Carry out taking inventory (this is the new print inventory rule):
	say "You are carrying: ";
	list the contents of the player, as a sentence, giving inventory information, including all contents;
	say ".".

Printing the content of nowhere is an activity.
Rule for printing the content of nowhere:
	say "Nowhere:[line break]";
	let L be the list of the off-stage things;
	repeat with thing running through L:
		say "  [thing][line break]";

Printing the things on the floor is an activity.
Rule for printing the things on the floor:
	let R be the location of the player;
	let L be the list of things in R;
	remove yourself from L;
	remove the list of containers from L;
	remove the list of supporters from L;
	remove the list of doors from L;
	if the number of entries in L is greater than 0:
		say "There is [L with indefinite articles] on the floor.";

After printing the name of something (called target) while
printing the content of the room
or printing the content of the world
or printing the content of the inventory
or printing the content of nowhere:
	follow the property-aggregation rules for the target.

The property-aggregation rules are an object-based rulebook.
The property-aggregation rulebook has a list of text called the tagline.

[At the moment, we only support "open/unlocked", "closed/unlocked" and "closed/locked" for doors and containers.]
[A first property-aggregation rule for an openable open thing (this is the mention open openables rule):
	add "open" to the tagline.

A property-aggregation rule for an openable closed thing (this is the mention closed openables rule):
	add "closed" to the tagline.

A property-aggregation rule for an lockable unlocked thing (this is the mention unlocked lockable rule):
	add "unlocked" to the tagline.

A property-aggregation rule for an lockable locked thing (this is the mention locked lockable rule):
	add "locked" to the tagline.]

A first property-aggregation rule for an openable lockable open unlocked thing (this is the mention open openables rule):
	add "open" to the tagline.

A property-aggregation rule for an openable lockable closed unlocked thing (this is the mention closed openables rule):
	add "closed" to the tagline.

A property-aggregation rule for an openable lockable closed locked thing (this is the mention locked openables rule):
	add "locked" to the tagline.

A property-aggregation rule for a lockable thing (called the lockable thing) (this is the mention matching key of lockable rule):
	let X be the matching key of the lockable thing;
	if X is not nothing:
		add "match [X]" to the tagline.

A property-aggregation rule for an edible off-stage thing (this is the mention eaten edible rule):
	add "eaten" to the tagline.

The last property-aggregation rule (this is the print aggregated properties rule):
	if the number of entries in the tagline is greater than 0:
		say " ([tagline])";
		rule succeeds;
	rule fails;

The objective part 0 is some text that varies. The objective part 0 is "I hope you're ready to go into rooms and interact with objects, because you've just entered TextWorld! First of all, look and see that the type 7 portal is unlocked. Then, assure that the type 7 porta".
The objective part 1 is some text that varies. The objective part 1 is "l is opened. After that, attempt to go west. Following that, try to take a trip south. And then, lift the pizza from the floor of the office. That's it!".

An objective is some text that varies. The objective is "[objective part 0][objective part 1]".
Printing the objective is an action applying to nothing.
Carry out printing the objective:
	say "[objective]".

Understand "goal" as printing the objective.

The taking action has an object called previous locale (matched as "from").

Setting action variables for taking:
	now previous locale is the holder of the noun.

Report taking something from the location:
	say "You pick up [the noun] from the ground." instead.

Report taking something:
	say "You take [the noun] from [the previous locale]." instead.

Report dropping something:
	say "You drop [the noun] on the ground." instead.

The print state option is a truth state that varies.
The print state option is usually false.

Turning on the print state option is an action applying to nothing.
Carry out turning on the print state option:
	Now the print state option is true.

Turning off the print state option is an action applying to nothing.
Carry out turning off the print state option:
	Now the print state option is false.

Printing the state is an activity.
Rule for printing the state:
	let R be the location of the player;
	say "Room: [line break] [the internal name of R][line break]";
	[say "[line break]";
	carry out the printing the content of the room activity;]
	say "[line break]";
	carry out the printing the content of the world activity;
	say "[line break]";
	carry out the printing the content of the inventory activity;
	say "[line break]";
	carry out the printing the content of nowhere activity;
	say "[line break]".

Printing the entire state is an action applying to nothing.
Carry out printing the entire state:
	say "-=STATE START=-[line break]";
	carry out the printing the state activity;
	say "[line break]Score:[line break] [score]/[maximum score][line break]";
	say "[line break]Objective:[line break] [objective][line break]";
	say "[line break]Inventory description:[line break]";
	say "  You are carrying: [a list of things carried by the player].[line break]";
	say "[line break]Room description:[line break]";
	try looking;
	say "[line break]-=STATE STOP=-";

Every turn:
	if extra description command option is true:
		say "<description>";
		try looking;
		say "</description>";
	if extra inventory command option is true:
		say "<inventory>";
		try taking inventory;
		say "</inventory>";
	if extra score command option is true:
		say "<score>[line break][score][line break]</score>";
	if extra score command option is true:
		say "<moves>[line break][turn count][line break]</moves>";
	if print state option is true:
		try printing the entire state;

When play ends:
	if print state option is true:
		try printing the entire state;

After looking:
	carry out the printing the things on the floor activity.

Understand "print_state" as printing the entire state.
Understand "enable print state option" as turning on the print state option.
Understand "disable print state option" as turning off the print state option.

Before going through a closed door (called the blocking door):
	say "You have to open the [blocking door] first.";
	stop.

Before opening a locked door (called the locked door):
	let X be the matching key of the locked door;
	if X is nothing:
		say "The [locked door] is welded shut.";
	otherwise:
		say "You have to unlock the [locked door] with the [X] first.";
	stop.

Before opening a locked container (called the locked container):
	let X be the matching key of the locked container;
	if X is nothing:
		say "The [locked container] is welded shut.";
	otherwise:
		say "You have to unlock the [locked container] with the [X] first.";
	stop.

Displaying help message is an action applying to nothing.
Carry out displaying help message:
	say "[fixed letter spacing]Available commands:[line break]";
	say "  look:                describe the current room[line break]";
	say "  goal:                print the goal of this game[line break]";
	say "  inventory:           print player's inventory[line break]";
	say "  go <dir>:            move the player north, east, south or west[line break]";
	say "  examine ...:         examine something more closely[line break]";
	say "  eat ...:             eat edible food[line break]";
	say "  open ...:            open a door or a container[line break]";
	say "  close ...:           close a door or a container[line break]";
	say "  drop ...:            drop an object on the floor[line break]";
	say "  take ...:            take an object that is on the floor[line break]";
	say "  put ... on ...:      place an object on a supporter[line break]";
	say "  take ... from ...:   take an object from a container or a supporter[line break]";
	say "  insert ... into ...: place an object into a container[line break]";
	say "  lock ... with ...:   lock a door or a container with a key[line break]";
	say "  unlock ... with ...: unlock a door or a container with a key[line break]";

Understand "help" as displaying help message.

Taking all is an action applying to nothing.
Check taking all:
	say "You have to be more specific!";
	rule fails.

Understand "take all" as taking all.
Understand "get all" as taking all.
Understand "pick up all" as taking all.

Understand "take each" as taking all.
Understand "get each" as taking all.
Understand "pick up each" as taking all.

Understand "take everything" as taking all.
Understand "get everything" as taking all.
Understand "pick up everything" as taking all.

The extra description command option is a truth state that varies.
The extra description command option is usually false.

Turning on the extra description command option is an action applying to nothing.
Carry out turning on the extra description command option:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	Now the extra description command option is true.

Understand "tw-extra-infos description" as turning on the extra description command option.

The extra inventory command option is a truth state that varies.
The extra inventory command option is usually false.

Turning on the extra inventory command option is an action applying to nothing.
Carry out turning on the extra inventory command option:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	Now the extra inventory command option is true.

Understand "tw-extra-infos inventory" as turning on the extra inventory command option.

The extra score command option is a truth state that varies.
The extra score command option is usually false.

Turning on the extra score command option is an action applying to nothing.
Carry out turning on the extra score command option:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	Now the extra score command option is true.

Understand "tw-extra-infos score" as turning on the extra score command option.

The extra moves command option is a truth state that varies.
The extra moves command option is usually false.

Turning on the extra moves command option is an action applying to nothing.
Carry out turning on the extra moves command option:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	Now the extra moves command option is true.

Understand "tw-extra-infos moves" as turning on the extra moves command option.

To trace the actions:
	(- trace_actions = 1; -).

Tracing the actions is an action applying to nothing.
Carry out tracing the actions:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	trace the actions;

Understand "tw-trace-actions" as tracing the actions.

The restrict commands option is a truth state that varies.
The restrict commands option is usually false.

Turning on the restrict commands option is an action applying to nothing.
Carry out turning on the restrict commands option:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	Now the restrict commands option is true.

Understand "restrict commands" as turning on the restrict commands option.

The taking allowed flag is a truth state that varies.
The taking allowed flag is usually false.

Before removing something from something:
	now the taking allowed flag is true.

After removing something from something:
	now the taking allowed flag is false.

Before taking a thing (called the object) when the object is on a supporter (called the supporter):
	if the restrict commands option is true and taking allowed flag is false:
		say "Can't see any [object] on the floor! Try taking the [object] from the [supporter] instead.";
		rule fails.

Before of taking a thing (called the object) when the object is in a container (called the container):
	if the restrict commands option is true and taking allowed flag is false:
		say "Can't see any [object] on the floor! Try taking the [object] from the [container] instead.";
		rule fails.

Understand "take [something]" as removing it from.

Rule for supplying a missing second noun while removing:
	if restrict commands option is false and noun is on a supporter (called the supporter):
		now the second noun is the supporter;
	else if restrict commands option is false and noun is in a container (called the container):
		now the second noun is the container;
	else:
		try taking the noun;
		say ""; [Needed to avoid printing a default message.]

The version number is always 1.

Reporting the version number is an action applying to nothing.
Carry out reporting the version number:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	say "[version number]".

Understand "tw-print version" as reporting the version number.

Reporting max score is an action applying to nothing.
Carry out reporting max score:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	if maximum score is -32768:
		say "infinity";
	else:
		say "[maximum score]".

Understand "tw-print max_score" as reporting max score.

To print id of (something - thing):
	(- print {something}, "^"; -).

Printing the id of player is an action applying to nothing.
Carry out printing the id of player:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	print id of player.

Printing the id of EndOfObject is an action applying to nothing.
Carry out printing the id of EndOfObject:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	print id of EndOfObject.

Understand "tw-print player id" as printing the id of player.
Understand "tw-print EndOfObject id" as printing the id of EndOfObject.

There is a EndOfObject.


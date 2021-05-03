## Day 1


### Developing Project Idea

#### Coding curiosity

I was very inspired by a conversation we had in class about a reading that presented a robot as being curious and I started thinking about how curiosity can be coded. I am, thus, thinking about building a system that has curiosity coded into it. Alternatively, working on this will force me to have a lot of conversations about what curiosity means and how human psychology can and should be translated into code. Therefore, if I fail to develop a curious robot, I would like to write about the process, research, conversations, and findings along with the failed code and have that be my final submission.


## Day 2 

### Thinking of Implementation and presentation

After reflecting a lot on what curiosity is I came to the following conclusions: -Curiosity requires selective interest on a specific thing.

-Curiosity is based on context; your surroundings influence what you are curious about.(Random objects on the screen)

-Curiosity can be essentialized as a series of questions about a specific thing.(Main character reading objects DNA)

-Curiosity is investigative; it is naturally followed by trying to find answers.(Main character working with object DNA)

-Curiosity is often accompanyied by change in the way we think and act.(Main character mutating from DNA encountered)

-Curiosity is accompanied by free will; we sometimes choose what we are curious about why we choose this can either be random or predetermined depending on whose philosophy one susbscribes to.(Randomness in how the move(random flowfield for randomness and predeterminedness by how objects die after the main character encounters them)

-Curiosity is infinite, you never stop being curious.(Adding a feature that adds objects to be curious about)

After this, I think I want to build a system similar to the evolution project where when certain conditions are met by a vehicle's surroundings (the surroundings being other vehicles and other variable elements), and depending on what those conditions are, the vehicle asks questions and investigates the data about these elements to generate answers that will be outwardly reflected as a mutation of the inquisitive vehicle (what this mutation will look like is still in the works). Once this mutation happens, the vehicle will no longer ask the same questions when similar conditions happen again(because it has learned) and instead either ask different questions or become unfazed by these conditions and instead look at other conditions in its context and ask questions about that.

I want to implement free will by randomizing the focus on the vehicle but this randomness will be goverened by some conditions to adress the main logical reasoning that is the basis of the ambiguity surrounding free will and fate.

Presentation
I am thinking of having this piece be a visual piece. Kind of like a movie made with code(?) but one in which the user has some influence on what the vehicle encounters(the robot version of playing god?)but ultimately allowing the system to make the final decisions.

Concerns
I am concerned that my approach to curiosity and what it means is too simplistic. I will, thus, do a little more reading on the science and philosophy of curiosity.



## Day 3

### Thinking about implementation and presenantation more

#### Implementation
Upon reflecting more on curiosity, I have decided to also inculde elements of infinity because curiosity is infinate. I plan on executing this by allowing the user to continuously generate the curious objects as well as their surroundings. Further, I think incorporating an interactive element will feed into, quite interestingly, with the conversation about how designing robotic systems that mimic humans is essentially humans playing God.

#### Presentation

I have decisded to present my project as a series of paintings produced by code: the project now will answer the question "what does curiosity look like?"

## Day 4

### Coding the curious beings and their surroundings

I coded so that there are distinct objects that vary in colour and shape. The data for each object is stored in the DNA class. The curious characters are round and whenever they encounter the objects that are the surroundings, it retrieves that objects DNA(asking a question about its nature and looking for an answer). Onece the DNA data has been retrieved(this data is primarily the colour of the surrounding object), I coded a mutation function where this data is added to the value of the curious object's DNA(the curious object learns and changes). The curious character now assumes the color of the object it just encountered mixed with its original color.

### Difficulties

Figuring out how to code differences within the same group of vehicles, especially differences that can be used to distinguish one object from another within the code, was challenging. I adressed this by utilizing the agressive() function. In this function, the curious objects were coded as the agressive objects that should be avoided. I coded it so that, statistically, the curious objects are almost always the only agressive objects. The conditions for when the other objevcts encounter the agressive objects are set to be that the non-agressive object dissapears after encountering the curious objects (reflecting how we don;t tend to act curious about the smae thing twice after we have already found ansers for what we were curious about).

## Day 5

### Fixing bugs

## Day 6

### Creating paintings using the code

Final products can be found in teh README.md

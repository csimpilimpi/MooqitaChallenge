Comments to Linux challenge - beginner

* No more than 15 characters for each line

My understanding is that the lines should thus be between 1 and 15 characters long.
I can imagine certain situations where more weight would be given to longer lines (e.g. the occurance of a 15 character long line would be more likely than a 1 character long one), but as nothing was specified in this respect, I decided to go with the case when each line length should be of the same probability, i.e. 1/15.

* As characters assume the Latin Alphabet, without special characters and the numbers from 0 to 9

Here, again, I decided to give the same probability to each of the 62 characters (2*26 + 10)

* What is a good way to control the size of a file? Discuss what options you know and why you picked one of them.

A while or an until loop. I chose the while loop but an until loop would have been just as good.

* Come up with two ways in Linux to find the size of a file.

wc -c or stat. I used stat.

* Select a sorting style. Which one did you use? Why?

The lines could be sorted by length (number of characters) or alphabetically. If alphabetically, the numbers could come first or last, the order (both that of the letters and the numbers) ascending or descending. Capital letters could be treated identical to small letter, or they could come first, or last.
As nothing was specified in the description of the challenge, I just used the default sorting option of the Linux command "sort".

* What is the most common command in Linux to sort a file and what happens when you use the default option?

"sort", and the default option sorts the file ascending, alphabetically, where lines starting with a number come first, and capital letters come after small letters.

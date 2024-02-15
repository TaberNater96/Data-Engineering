<center><h1>US Climate Change Analysis Using Window Functions</h1></center>

This SQL project utilizes a variety of window functions to engineer multiple features in order to gain additional insight off of a table that only contains a state, year, and average temperature. The results of this project display the highest and lowest average temperatures for each state based on 125 years of data. As one will see, the features in this project are driven by a PARTITION function which is similar to a GROUP BY function, but in the context of a particular window, allowing the rows to retain their separate identities. Unbound ranges were used to aggregate a series of rows that were both before and after each partitioned row in order to get a full viewed computation such as the highest and lowest value in a particular subset.

#### Preview of the first few rows, the same pattern is repeated for all states where the warmest rank is at the top:


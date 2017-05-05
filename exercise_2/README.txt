Exercise 2 - Instructions on how to run the application

Steps:
1. Create postgres database and table called tcount. To do this, run "python
create-tcount.py" in the exercise_2 folder.
2. Open the spout tweet.py and input your Twitter credentials.
3. Navigate to the "extweetwordcount" folder and run: "sparse run". You will
see the application running and tweets appearing on the screen.
4. Once the application has been running for roughly 30-60 seconds, hit
CONTROL+C to stop the application. You can run the application for as long as
you want but 30-60 seconds should be sufficient for this exercise.
5. At this point the postgres table "tweetwordcount" has been populated. You
can run "finalresults.py" or "histogram.py" to see results or you can query
the table from postgres directly.

1) Create a dropdown menu for each question that limits possible answer input. Create class called answers, append to dropdown. Allow user to create new answer with simple input text form. Answer table would have a question_id column.

2) Create landing page that has two links: one for creator and one for audience. Audience will be presented a list of survey options and can fill them out by clicking on that survey, answering each question with multiple choice dropdown menu.

3) Questions would each be located on a unique page id. Submit form would include multiple choice selection from dropdown. app.rb pulls question ID value and passes through Question.find(id + 1) to rotate through all questions within Survey.

4) (Doesn't make sense)

5) Create a User Class and an Answer class (with one to many relationships in User/Survey/Question/Answer Class hierarchy). Pull data out of user class.

6) In Questions Class, replace multiple choice dropdown with multiple choice checkbox for survey question answers.

7) For open ended questions, receive input with text box.

8) Mix mode question design, include 'other' with some questions for user text input.

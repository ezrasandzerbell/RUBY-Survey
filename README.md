# _Survey_

#### _Web App for conducting Surveys with Admin and User functionality, 11.18.16_

#### By _**Ezra Sandzer-Bell**_

## Description

Create a dropdown menu for each question that limits possible answer input. Create class called answers, append to dropdown. Allow user to create new answer with simple input text form. Answer table would have a question_id column.

Create landing page that has two links: one for creator and one for audience. Audience will be presented a list of survey options and can fill them out by clicking on that survey, answering each question with multiple choice dropdown menu.

Questions would each be located on a unique page id. Submit form would include multiple choice selection from dropdown. app.rb pulls question ID value and passes through Question.find(id + 1) to rotate through all questions within Survey.

Create a User Class and an Answer class (with one to many relationships in User/Survey/Question/Answer Class hierarchy). Pull data out of user class.

In Questions Class, replace multiple choice dropdown with multiple choice checkbox for survey question answers.

For open ended questions, receive input with text box.

Mix mode question design, include 'other' with some questions for user text input.

## Technologies Used

_This site was built with Ruby, HTML, and CSS. Temporary hosting and spec integration testing was performed with Sinatra_

### License

*Open Source*

Copyright (c) 2016 **_Ezra Sandzer-Bell_**

# 4443-Msu Internet of Things

## Summer 2025

### Assumed

- This course assumes you understand
  - Basic programming

|                                                                         |     |                                                                         |
| ----------------------------------------------------------------------- | --- | ----------------------------------------------------------------------- |
| <img src="https://images2.imgbox.com/cf/72/1rVot2oi_o.png" width="150"> |     | <img src="https://images2.imgbox.com/46/07/hq4ABrFS_o.png" width="150"> |

## Office Hours

<a href="https://images2.imgbox.com/6e/30/FSEnPfv3_o.png" target="_blank"><img src="https://images2.imgbox.com/2e/d1/fijnUrAH_o.png" alt="image host" width="300"/></a>

I will be available after class every day and available for zoom every evening.

### General Course Info

- **Section 201:**
  - **Days:** MWRF
  - **Time:** 1220 - 1420
  - **Location:** Bolin 324
- **Semester:** July 7 - August 7
- **Holidays:** None
- **Last Day for “W”:** Good Question
- **Last Day of Class:** It never ends
- **Final Exam:** Last day of class
  Absolutely, Terry. Here's a list of **foundational course topics** that underpin just about every embedded/IoT-style project your students would do — from blinking LEDs to full-blown sensor networks. This is _not_ a syllabus, but a **concept scaffold**: the core ideas you build on again and again to make all the blinking, buzzing, sensing, and automating happen.

---

### Course Topics

- Embedded Systems Basics
- Digital vs Analog Signals
- Voltage, Current, and Resistance (Ohm's Law)
- Breadboarding and Prototyping
- Microcontroller Architecture (MCU vs CPU)
- GPIO (Digital Input and Output)
- Analog Input (ADC & Sensors)
- Pulse Width Modulation (PWM)
- Timing and Delays (millis(), delay(), interrupts)
- Serial Communication (UART, USB Serial)
- Power Management (Battery, 3.3V vs 5V, regulators)
- Event-Driven Programming (buttons, interrupts)
- State Machines (Finite State, Moore/Mealy-style logic)
- I2C and SPI Protocols (multi-device communication)
- Libraries and Drivers (modular code reuse)
- Object-Oriented Programming in Embedded Contexts
- Functions and Modularity (code structure and reuse)
- Debugging Techniques (Serial monitor, logic analyzer)
- Using Sensors (temperature, light, distance, etc.)
- Actuators (motors, servos, buzzers)
- Display Systems (LEDs, LCDs, OLEDs)
- Wireless Communication (Bluetooth, Wi-Fi, LoRa, RF)
- Data Logging (EEPROM, SD cards, or flash storage)
- Embedded File Handling (if applicable)
- Cloud Interaction Basics (MQTT, REST, APIs)
- Real-Time Constraints and Loop Timing
- Security and Reliability (intro to safety in embedded)
- Design Thinking for IoT (Problem → Prototype → Iterate)
- Version Control (Git for embedded projects)
- Documentation and Collaboration (README, Markdown, schematic sharing)

---

## 🧱 Categorized by Concept Domain

### 🔌 **Hardware & Electronics**

- Ohm's Law, Voltage/Current
- Resistors, LEDs, sensors
- Analog vs Digital signals
- Power sources & regulation

### 🧠 **Core MCU Programming**

- GPIO basics
- Analog input
- PWM output
- Delays, timers, millis(), interrupts

### 📬 **Communication & Data**

- Serial (UART)
- I2C, SPI
- Wireless protocols
- Cloud interaction (REST, MQTT)

### 🛠️ **Code Architecture**

- Modular functions
- OOP design
- Driver abstraction
- State machines

### 📉 **Tools & Debugging**

- Serial monitor
- LED as a debug tool
- Logic analyzers
- Basic oscilloscope usage

### 📐 **Design & Delivery**

- Documentation (Markdown, inline code comments)
- Schematic sharing (Fritzing, KiCAD)
- Git/GitHub basics
- Real-world use-case modeling

---

## 🔁 Reusable Student Wisdom

You might call this the **“craftsman’s toolbox”**. Students will revisit:

- Analog read → use it in dozens of sensor projects
- PWM → motors, LEDs, servos
- GPIO → _literally everything_
- Serial → their best debugging friend
- millis() vs delay() → always a revelation when they learn the difference

---

## Calendar

Lab day everyday.

## Grading

| Categories                              | Weight |     | Letter Grade | Grade Range |
| :-------------------------------------- | :----: | :-: | :----------: | :---------- |
| ~~~Exams (3)<sup>**1**</sup>~~~ Show Up | ⇦ 40%  |     |     A ⇨      | 90-100      |
| ~~~Programs (3)<sup>**2**</sup>~~~ Work | ⇦ 25%  |     |     B ⇨      | 80-89       |
| ~~~Final<sup>**3**</sup>~~~ No Exams    | ⇦ 20%  |     |     C ⇨      | 70-79       |
| Participation<sup>**1**</sup>           | ⇦ 20%  |     |     D ⇨      | 60-69       |
| Projects<sup>**2**</sup>                | ⇦ 30%  |     |     F ⇨      | below 60    |
| Github Portfolio<sup>**3**</sup>        | ⇦ 50%  |     |     F ⇨      | below 60    |

#### Note<sup>1</sup> : Missing reduces your grade. This not the class you can never come but still turn in your homework, then show up for the exam and do just fine. For this class **Miss Class = Lose Points.** Sounds harsh but lab partners or teams may really need you.

#### Note<sup>2</sup> : We will work on projects everyday. Most likely you will have a partner, or be on a team. So this portion of your grade ranks you on what attitude you brought to the class. Did you make the class better? Or worse? I am trying to encourage you to be helpful and friendly. Maybe ask questions or start discussions. Your grade gets adjusted based on your personality type. For example: if your shy I will expect a bit of effort to engage, if your loud and obnoxious, I will expect you to tone it down and help people. I'm not a psychologist, but I was a drill instructor so I can easily discern between the aforementioned.

#### Note<sup>3</sup> : You need to have a repo for this course. Usually it just means upload your code. However, that doesn't tell the tale! There is so much more to be proud of and show off to future employers! All projects will be documented with photos, videos, and README's that are so detailed they will read like a tutorial.

## 📘 Teaching Philosophy (Lab-Based)

My teaching philosophy for this class is rooted in real-world, problem-based learning. We won’t move in lockstep through a calendar of prepackaged lectures. Instead, we build skills by working on hands-on projects every day, adjusting to student questions, emerging tech, and the needs of the group. The structure is flexible; the core learning is not.

In this course, showing up and contributing matters. You’ll likely work in teams, and your peers will rely on your input, your curiosity, and your effort. Whether you’re introverted or outspoken, I expect you to make the classroom better — not louder, not quieter — just more collaborative.

You’ll create a public-facing GitHub repo that documents your work like a professional engineer would: code, photos, videos, detailed READMEs. These aren’t just assignments — they’re portfolio pieces you can be proud of.

This class is designed to simulate the messy, nonlinear nature of real development, where problems don’t come in neat chapters and where solutions aren’t multiple choice. We’ll embrace that — together.

## How to Succeed

I encourage every student to firstly just **go to class**! Beyond that, attempt to participate in class discussions and also ask questions in class. Believe me, classes that have many student questions with a subsequent discussion, seem do much better in understand a topic as a class.

More importantly you should interact with your fellow students outside of class as well. Start a study group, post links on Slack, ask questions on Slack! Stay involved with your classmates. Also, if you see posts on slack, respond to these posts either with a text response or an emoticon reaction to the post. No one likes to post something, and then feel as no one has read it.

If you need help in understanding a topic, you need to message me immediately so I can either text you a response, or zoom with you to get things cleared up. And yes I will zoom late into the evening if that is necessary. I'm not saying I'm at your beckon call, but I try to make myself very available.

Lastly, this isn't totally about your own success, but it helps me succeed. Asking me questions with direct message or on the course channel is a huge help! I can turn that question into (what the military calls) an "overhead correction", meaning I can clarify something to the entire class. It does not mean I will use your name (unless you publicly post it, then that is on you :) ), but it does give me the opportunity to clarify things to the entire class, since most questions tend to be what the majority of students in the class are thinking.

## My View on Cheating / Plagiarism

- Most plagiarizing, when it comes to programming, happens for two reasons:
  - 1. You don't have a clue how to solve the problem, so you get a friend or the internet to help.
       > This can be ok, if you cite your resource, and only find small snippets of code to work into your own solution.
  - 2. You didn't start early enough, and you're desperate to get something working the night before it's due, so you get a friend or the internet to help.
       > This is never ok.
- Both are easy to fix.
  - 1. Come ask me to explain. I promise you're not the only one who is confused.
  - 2. Start early. Then when you get stuck, you can ask for help the right way!

### Presentations

(Not all of my courses will have presentations, but when possible I will try and encorporate presentations into the currculum.)

- Presentations are a major component of your course work at MSU. The ability to discuss complex topics in front a group of your peers is an important skill to have.
- Depending on the course, and the size of the class, you may have many presentations, or just one presentation.
- The quality of a presentations that accompanies a programming project is highly coupled with the quality of your project. A poor project makes it hard to give a proper presentation on a project in which you did not complete.
- On the other hand, an excellent project doesn't ensure a great presentation either.
- **Preparation is key**, and I am **ALWAYS** available for help with presentations.
- I will give specific requirements for each presentation since each project may vary greatly, but in general project presentations in my course should follow a basic outline:
  - Project description (if necessary)
  - A logical progression of your steps in implementing the project. Make sure to include:
    - Pitfalls (any confusing components that gave problems)
    - Highlights (any good solutions or components you are proud of)
    - Summarize the results or final product whether it be the completed features of the project or the results of any data you processed.
- Be prepared! Sometimes showing your project seems easy since you spent many hours writing it and have a very deep understanding of it, but this does not translate to a good presentation.
- A good presentation is well thought out and practiced.
- Side Notes:
  - A well thought out presentation allows you to hide flaws or unfortunate "features" that you may not want anyone to know about.
  - I am also much less inclined to ask pointed questions if you have a well thought out and thorough presentation.

## Miscellaneous

Some of these points are duplicated in other places in this document. It's ok.

- All students need a [Github](http://github.com) account
- All programs need to be turned in and running to pass the course
- General Assignment Rules:
  - Due dates and times are as listed on assignment and can change with prior notice to class, and always in your favor (aka more time).
  - Formatting of programs is important, and will be graded accordingly.
  - Your name is required on ALL documents uploaded or turned in. A handwritten name is not acceptable unless done in class.
  - For any assignment, you will create a folder and include all documents created by you within this folder for submission. This includes programs, input / output files, readme's, documentation, etc. This folder will subsequently be uploaded to Github in the repo you created for the course.
- Attending class is one of the primary keys to doing well in this class. Students may be dropped for excessive absences. There is no distinction made between excused and unexcused.
- Make-up exams are not given. If I see fit, then I will replace a missed exam with your final exam test grade (but this is optional to instructor based on circumstances, attendance, participation, etc.).
- Late work will be accepted on a case by case basis. Late penalty is 15 points (out of 100) for initial lateness and 1 half a letter grade (5 points) for every class period until the total reduced is 50 (half credit). Extremely late work is totally at the instructors discretion on whether it will be accepted or not.
- Programs containing syntax errors are unacceptable and will be returned without grading (your programs must work).
- Periodically homework assignments will be taken up and graded. It is the student's responsibility to keep up with assignments and to ask questions over the assigned work, even if absent. All homework assignments are due at the specified time that may or may not be in conjunction with a class day. All assignments / homeworks will be uploaded via Github.

## LLM (Large Language Models)

**Caution Regarding the Use of Large Language Models (LLMs aka Chat Gpt and the like)**

While Large Language Models (LLMs) like ChatGPT can be valuable tools for obtaining information and assistance, it is essential to use them responsibly. Relying heavily on LLMs for completing assignments or understanding course material may impede your own learning and critical thinking development. This course encourages active engagement with the content, independent problem-solving, and collaboration with peers and instructors. Please use LLMs as supplementary resources rather than substitutes for your own study and effort to ensure a meaningful and effective educational experience.

## Official Course and Department Policies

### Attendance Policy

Although student attendance is not calculated into the grade, attendance will be taken each day to track students. If a student is absent more than 2 classes without an excuse and is not performing well in class, a report can be submitted to the Dean of Students and the student may be dropped from the class. Classes will not be streamed for absent students, whether it is excused or not.

### Behavior in the classroom

Students are to assist in maintaining a classroom environment that is conducive to learning. This means that the presence of electronic devices other than your calculator are not to be seen, heard, or implied, ever. Questions are encouraged and discussion is acceptable, provided it is pertinent and does not distract from the lesson.

### Make Up Work/Exams/Quizzes:

- For planned excused absences: Exam may be taken early by prior arrangement.
- For unplanned documented absences: I may replace your exam grade with your final exam grade. I reserve the right to make that decision.
- For unplanned undocumented absences: Zero on the exam

### Late Work

Late programs will be accepted with an initial **15 point** reduction and then a **5 point **deduction class day. **_No late programs for last programming assignment. No late homework will be allowed in the Connect System._**

**Computer Requirements:** Taking this class requires you to have access to a computer (with Internet access) to access online course material. **_Personal computer technical difficulties will not be considered a reason for extra time to submit assignments, tests, or online discussion postings._** Computers are available on campus in various areas of the buildings, as well as the in the library. Contact your instructor immediately upon having computer trouble. If you have technical difficulties in the course, there is also a student helpdesk available to you. The university cannot work directly on student computers due to both liability and resource limitations, however they are able to help you get connected to our online services. For help, log into[` `\*\*D2L.](https://d2l.msutexas.edu/)\*\*

### Policy on Testing Process

The Department of Computer Science has adopted the following policy related to testing.

- All bags, purses, electronics (turned off), books, etc. will be placed in the front of the room during exams, or in an area designated by the instructor.
- Unless otherwise announced by the instructor, nothing is allowed on the desk but pen/pencil/eraser and test papers.
- A student who leaves the room during an exam must turn in the test and will not be allowed to return.

### Policy on Programs

- Tests _will_ have questions covering out-of-class assignments. Know the material!
- Students will be invited to orally answer questions regarding their assignments in my office and failure to answer those questions correctly will result in deductions from their grades. (Every student can expect to be invited 1-2 times during the semester to answer questions.)

### Computer Science Tutoring

Tutoring is available in **_Bolin Room 119 & the Office of Tutoring and Academic Support Programs (TASP)_** in Moffett Library. A tutor may assist with programs and homework for computer science classes. The tutor will not do your work.

### Academic Misconduct Policy & Procedures

Cheating, collusion, and plagiarism (the act of using source material of other persons, either published or unpublished, without following the accepted techniques of crediting, or the submission for credit of work not the individual’s to whom credit is given). The Department of Computer Science has adopted the following policy related to cheating (academic misconduct). The policy will be applied to all instances of cheating on assignments and exams as determined by the instructor of the course. (See below for link to MSU definitions.)\*\*

- 1st instance of cheating in a course: The student will be assigned a non-replaceable grade of zero for the assignment, project or exam. _If the final grade in the course, does not result in a one letter grade reduction, the student will receive a one letter grade reduction in course._
- 2nd instance of cheating in a course: The student will receive a grade of F in course & immediately be removed from course.
- All instances of cheating will be reported to the Department Chair and, in the case of graduate students, to the Department Graduate Coordinator.

**_Note: Letting a student look at your work is collusion and is academic misconduct!_**

See Also: [ MSU Student Handbook:](https://msutexas.edu/student-life/_assets/files/handbook.pdf) Appendix E: Academic Misconduct Policy & Procedures *https://msutexas.edu/student-life/\_assets/files/handbook.pdf*.

### Recording of Class Lectures

Permission must be requested in writing and obtained from the instructor before recording of class lectures. If permission is granted, the recording may only be used by the student making the recording. Recordings (or any class materials) may NOT be posted on any internet source without written permission of the instructor. Failure to adhere to the policy may result in removal from the course with a grade of F or other appropriate punishment.

## University Policies and Procedures

### Student with Disabilities

Any student who, because of a disability, may require special arrangements in order to meet the course requirements should contact the instructor as soon as possible. Students should present appropriate verification from Disability Support Office during the instructor’s office hours. Please note instructors are not allowed to provide classroom accommodations to a student until appropriate verification has been provided. For additional information, contact the Disability Support Office in Clark Student Center 168 - Phone: (940) 397-4140

### Policy on Concealed Handguns on Campus

Senate Bill 11 passed by the 84th Texas Legislature allows licensed handgun holders to carry _concealed_ handguns on campus, effective August 1, 2016. Please note, open carry of handguns, whether licensed or not, and the carrying of all other firearms, whether open or concealed, are prohibited on campus. Areas excluded from concealed carry are appropriately marked, in accordance with state law. For more information regarding campus carry, please refer to the University’s webpage at[ MSU Campus Carry Policy ](https://msutexas.edu/campus-carry/rules-policies)*https://msutexas.edu/campus-carry/rules-policies*. If you have questions or concerns, please contact MSU Chief of Police Steven Callarman at[ Steven.callarman@msutexas.edu.](mailto:steven.callarman@msutexas.edu)

### Midterm Progress Report

In order to help students keep track of their progress toward course objectives, the instructor for this class will provide a Midterm Progress Report for all students in the course through each student’s MSU Portal account. Midterm grades will not be reported on the students’ transcript; nor will they be calculated in the cumulative GPA. They simply give students an idea of where they stand at the midpoint of the semester. Students earning below a C at the midway point should a) schedule a meeting with the professor and b) Seek out tutoring.

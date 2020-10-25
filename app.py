from flask import Flask,render_template,redirect,request,session,url_for,flash,Response,make_response
from flask_mysqldb import MySQL
from flask_mail import *
from functools import wraps
import io
import csv
import xlwt

from passlib.hash import sha256_crypt
from wtforms import Form,StringField,TextAreaField,PasswordField,validators

app=Flask(__name__)
app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']=''
app.config['MYSQL_DB'] = 'upgrad'
app.config['SECRET_KEY']="5fac8abbefb2af8f4f700758739e3189"
app.config['MySQL_CURSORCLASS']='DictCursor'
mysql=MySQL(app)

app.config['MAIL_SERVER']='smtp.gmail.com'
app.config['MAIL_PORT']='465'
app.config['MAIL_USE_SSL']=True
app.config['MAIL_DEBUG']=True
app.config['MAIL_USERNAME']='meghawadhwa138@gmail.com'
app.config['MAIL_PASSWORD']='neelamwadhwa1381'
app.config['MAIL_ASCII_ATTACHMENTS']=True
mail=Mail(app)
def getLoginDetails():
    cur = mysql.connection.cursor()
    if 'email' not in session:
        loggedIn = False
        email = ''
    else:
        loggedIn = True
        cur.execute("SELECT userid,email FROM user WHERE email = '" + session['email'] + "'")
        userid, email = cur.fetchone()
       # cur.execute("SELECT count(prod_id) FROM cart WHERE id = " + str(id))
        #noOfItems = cur.fetchone()[0]
    cur.close()
    return (loggedIn,email)

class RegisteredForm(Form):
    fname=StringField('First Name',[validators.Length(min=1,max=50)])
    lname = StringField('Last Name', [validators.Length(min=1, max=50)])
    email=StringField('Email',[validators.Length(min=6,max=50)])
    password=PasswordField('Password',[
        validators.DataRequired(),
        validators.EqualTo('confirm',message='Password do not Match')
    ])
    confirm=PasswordField('confirm password')

def is_logged_in(f):
    @wraps(f)
    def wrap(*args,**kwargs):
        if 'logged_in' in session:
            return f(*args,**kwargs)
        else:
            flash('Unauthorized Please login','danger')
            return redirect(url_for('login'))
    return wrap

@app.route('/')
def index():
    loggedIn,email = getLoginDetails()
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM jobs ''')
    rows = cur.fetchall()
    cur.close()
    return render_template('index.html', rows=rows,loggedIn=loggedIn,email=email)


@app.route('/description/<int:jobid>')
def description(jobid):
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM jobs WHERE jobid=%s ''', (jobid,))
    cows = cur.fetchall()
    return render_template("jobdesc.html", cows=cows,jobid=jobid)

@app.route('/apply',methods=['GET', 'POST'])
def apply():
    if 'email' in session:
        em=session['email']
    cur = mysql.connection.cursor()
    cur.execute('''SELECT email FROM student ''')
    emails=cur.fetchall()
    status = True
    for x in emails:
        if em in x:
            status = False
    print(emails)
    if status:
        return render_template('studentdetails.html',emails=emails,)

    flash('Thankyou Your Resume have been Submitted', 'Success')
    return render_template('abc.html')

@app.route('/admin')
def admin():
    cur = mysql.connection.cursor()
    cur.execute("SELECT  * FROM student")
    data = cur.fetchall()
    cur.execute("SELECT  * FROM jobs")
    cols=cur.fetchall()
    cur.close()
    return render_template('admin.html', student=data,jobs=cols)




@app.route('/delete/<string:studid>', methods = ['GET'])
def delete(studid):
    flash("Record Has Been Deleted Successfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM student WHERE studid=%s", (studid,))
    mysql.connection.commit()
    return redirect(url_for('admin'))


@app.route('/sendemail/<string:studid>', methods = ['GET'])
def sendemail(studid):
    email = session['email']
    mail.send_message("New Message from Admin," + "Details Are: Thanks for Registering",sender=['meghawadhwa138@gmail.com'],
                      recipients=['email'],
                      body='This mail is for testing Purposes only...' + 'your id is :' + studid)
    return redirect(url_for('admin'))





@app.route('/login',methods=['GET', 'POST'])
def login():
    if request.method=="POST":
        email = request.form['email']
        password_candidate=request.form['password']
        cur=mysql.connection.cursor()
        result=cur.execute('''SELECT * FROM user WHERE email=%s''',[email])
        if result>0:
            data=cur.fetchone()
            password=data[4]
            if sha256_crypt.verify(password_candidate,password):
                session['logged_in']=True
                session['email']=email
                flash('You are now logged in','success')
                return redirect(url_for('index'))
            else:
                error='Invalid email or password'
                return render_template('login.html',error=error)

        else:
            flash('Username Not Found Kindly Register First','fail')
            return render_template('login.html')

    return render_template('login.html')

@app.route('/register',methods=['GET','POST'])
def register():
    form = RegisteredForm(request.form)
    if request.method == 'POST' and form.validate():
        fname = form.fname.data
        lname = form.lname.data
        email = form.email.data
        password = sha256_crypt.encrypt(str(form.password.data))
        cur = mysql.connection.cursor()
        cur.execute('''INSERT INTO user(fname,lname,email,password) VALUES(%s,%s,%s,%s)''',
                    (fname,lname,email,password))
        mysql.connection.commit()
        cur.close()
        flash('You are now registered and can login now', 'success')
        return redirect(url_for('login'))
    return render_template('register.html', form=form)

@app.route("/logout")
def logout():
    session.clear()
    return redirect(url_for('index'))

@app.route('/student',methods=['GET','POST'])
def studentdetails():
    loggedIn, email = getLoginDetails()
    if request.method == "POST":
        res = request.form
        Name = res.get('Name')
        phnum= res.get('phnum')
        email = res.get('email')
        address= res.get('address')
        fathersname = res.get('fathersname')
        fathersnum= res.get('fathersnum')
        fathersemail = res.get('fathersemail')
        university = res.get('university')
        stream = res.get('stream')
        grade = res.get('grade')
        backlog= res.get('backlog')
        yop = res.get('yop')
        pguniversity = res.get('pguniversity')
        pggrade = res.get('pggrade')
        pgbacklog = res.get('pgbacklog')
        pgyop= res.get('pgyop')
        worktitle= res.get('worktitle')
        working= res.get('working')
        placed= res.get('placed')
        linkedIn = res.get('linkedIn')
        github = res.get('github')
        cur = mysql.connection.cursor()
        cur.execute('''INSERT INTO student(Name,phnum,email, address,fathersname, fathersnum,fathersemail,university , stream,grade,backlog,yop,pguniversity,pggrade,pgbacklog,pgyop, worktitle,working,placed,linkedIn,github) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)''',
                    (Name,phnum, email,  address, fathersname, fathersnum,fathersemail,university , stream,grade,backlog,yop,pguniversity,pggrade, pgbacklog,pgyop,worktitle,working,placed,linkedIn,github))
        mysql.connection.commit()
        flash("Thanks,Your Details have been Saved.")

        return render_template('studentdetails.html')

    return render_template('studentdetails.html',loggedIn=loggedIn,email=email)


@app.route("/sort", methods=['GET', 'POST'])
def sort():
    if request.method=='POST':
        cur = mysql.connection.cursor()
        if request.form['submit_button'] == 'All':
            cur.execute("SELECT  *  FROM student ")
            data = cur.fetchall()
            cur.close()
            return render_template('admin.html', student=data)
        if request.form['submit_button'] == 'Placed':
            cur.execute("SELECT  *  FROM student WHERE placed='Yes' ORDER BY university")
            data = cur.fetchall()
            cur.close()
            return render_template('admin.html', student=data)
        if request.form['submit_button'] == 'Unplaced':
            cur.execute("SELECT  *  FROM student WHERE placed='No' ORDER BY university")
            data = cur.fetchall()
            cur.close()
            return render_template('admin.html', student=data)
        if request.form['submit_button'] == 'College':
            cur.execute("SELECT  *  FROM student  ORDER BY university")
            data = cur.fetchall()
            cur.close()
            return render_template('admin.html', student=data)
        if request.form['submit_button'] == 'Stream':
            cur.execute("SELECT  *  FROM student  ORDER BY stream")
            data = cur.fetchall()
            cur.close()
            return render_template('admin.html', student=data)
    return render_template('admin.html')

@app.route("/sortjob", methods=['GET', 'POST'])
def sortjob():
    if request.method=='POST':
        cur = mysql.connection.cursor()
        if request.form['submit_buttons'] == 'All':
            cur.execute("SELECT  *  FROM jobs ")
            cols = cur.fetchall()
            cur.close()
            return render_template('admin.html',jobs=cols)
        if request.form['submit_buttons'] == 'Drive Date':
            cur.execute("SELECT  *  FROM jobs  ORDER BY DriveDate")
            cols = cur.fetchall()
            cur.close()
            return render_template('admin.html', jobs=cols)

    return render_template('admin.html')


@app.route("/download/report/excel")
def download():
    cur = mysql.connection.cursor()
    cur.execute("SELECT  *  FROM student")
    result=cur.fetchall()
    output=io.BytesIO()
    workbook=xlwt.Workbook()
    sh=workbook.add_sheet("Student Report")
    sh.write(0,0,'studid')
    sh.write(0,1,'Name')
    sh.write(0, 2, 'phnum')
    sh.write(0, 3, 'email')
    sh.write(0, 4, 'address')
    sh.write(0, 5, 'fathersname')
    sh.write(0, 6, 'fathersnum')
    sh.write(0, 7, 'fathersemail ')
    sh.write(0, 8, 'university')
    sh.write(0, 9, 'stream')
    sh.write(0, 10, 'grade')
    sh.write(0, 11, 'backlog')
    sh.write(0, 12, 'yop ')
    sh.write(0, 13, 'pguniversity')
    sh.write(0, 14, ' pggrade')
    sh.write(0, 15, 'pgbacklog')
    sh.write(0, 16, ' pgyop')
    sh.write(0, 17, ' worktitle')
    sh.write(0, 18, 'working')
    sh.write(0, 19, 'placed')
    sh.write(0, 20, ' linkedIn')
    sh.write(0, 21, ' github')

    idx=0
    for row in result:
        sh.write(idx+1,0,row[0])
        sh.write(idx + 1, 1, row[1])
        sh.write(idx + 1, 2, row[2])
        sh.write(idx + 1, 3, row[3])
        sh.write(idx + 1, 4, row[4])
        sh.write(idx + 1, 5, row[5])
        sh.write(idx + 1, 6, row[6])
        sh.write(idx + 1, 7, row[7])
        sh.write(idx + 1, 8, row[8])
        sh.write(idx + 1, 9, row[9])
        sh.write(idx + 1, 10, row[10])
        sh.write(idx + 1, 11, row[11])
        sh.write(idx + 1, 12, row[12])
        sh.write(idx + 1, 13, row[13])
        sh.write(idx + 1, 14, row[14])
        sh.write(idx + 1, 15, row[15])
        sh.write(idx + 1, 16, row[16])
        sh.write(idx + 1, 17, row[17])
        sh.write(idx + 1, 18, row[18])
        sh.write(idx + 1, 19, row[19])
        sh.write(idx + 1, 20, row[20])
        sh.write(idx + 1, 21, row[21])
        idx+=1
        workbook.save(output)
        output.seek(0)
        return Response(output,mimetype="application/ms-excel",headers={"Content-Disposition":"attachment;filename=student_report.x"})


def transform(text_file_contents):
    return text_file_contents.replace("=", ",")


@app.route('/transform', methods=["POST"])
def transform_view():
    f = request.files['data_file']
    if not f:
        return "No file"

    stream = io.StringIO(f.stream.read().decode("UTF8"), newline=None)
    csv_input = csv.reader(stream)
    #print("file contents: ", file_contents)
    #print(type(file_contents))
    print(csv_input)
    for row in csv_input:
        print(row)

    stream.seek(0)
    result = transform(stream.read())

    response = make_response(result)
    response.headers["Content-Disposition"] = "attachment; filename=result.csv"
    return response

if __name__=="__main__":
    app.run(debug=True)
<?php include "header.php"?>
<?php include "sidebar.php"?>
<?php
include "../vendor/autoload.php";
use App\Database\Database;
use App\Utility\Utility;
use App\Session\Session;
use App\Student\Student;
use App\Result\Result;
$result = new Result();
?>
<?php
//session_start();
//
//print_r($_SESSION);
$errors = array();
$name = "";
$email = "";

$userid = $_SESSION['userid'];
$username = $_SESSION['username'];
$sql= "SELECT * FROM users WHERE `id` = $userid AND `username` = '$username'";
$stmt = Database::Prepare($sql);
$stmt->execute();
$data =  $stmt->fetch();
$std_email = $data['email'];
$sql= "SELECT * FROM students WHERE `email` = '$std_email'";
$stmt = Database::Prepare($sql);
$stmt->execute();
$data =  $stmt->fetch();
print_r($data['id']);
$reg_no = $data["reg_no"];
$_POST["result"] = $data['id'];
$_POST["gradeStd"] = $data['id'];


//die();

?>
<div class="content-wrapper">
    <section class="content">
        <div class="box box-default">
            <div class="box-header with-border text-center">
                <h1 class="box-title">Result</h1>
            </div>
            <div class="box-body">
                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                    <?php
                    echo Session::SuccessMsg();
                    echo Session::ErrorMsg();
                    ?>
                    <div class="form-group">
                      <label>Student Reg. No.</label>
                          <input type="text" class="form-control" name="name"  readonly="readonly" value= "<?php echo  $reg_no;?>"><br>
                    </div>
                    <div id="std_detail" class="form-group">
                      <?php  if (isset($_POST["result"])) {
                          $sql = "SELECT students.title, students.email , departments.id, departments.code FROM students LEFT JOIN departments on students.dept_id =
                        departments.id WHERE students.id = '" . $_POST["result"] . "'";
                          $stmt = Database::Prepare($sql);
                          $stmt->execute();
                          $data = $stmt->fetch();
                          ?>
                          <label>Student Name</label>
                          <input type="text" class="form-control" name="name"  readonly="readonly" value=" <?php echo $data["title"] ?>"><br>
                          <label>Student Email</label>
                          <input type="email" class="form-control" name="email" readonly="readonly" value="<?php echo $data["email"] ?>"><br>
                          <label>Department</label>
                          <input type="text" class="form-control" name="department" readonly="readonly" value="<?php echo $data["code"]
                              ?>"><br>
                          <a  class="btn btn-adn pull-right" href="pdf.php?pdfId= <?php echo $_POST["result"] ?>">Make PDF</a><br>
                          <?php
                      }

                         if (!empty($errors['deptEmpty'])){
                            echo Utility::error($errors["deptEmpty"]);
                        } ?>
                    </div>
                    <br>
                    <div class="form-group">
                        <table id="table_info" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>Course Name</th>
                                <th>Course Code</th>
                                <th>Grade</th>
                            </tr>
                            </thead>
                            <tbody id="results">
                            <?php
                            if (isset($_POST["gradeStd"])){
                                $query = "SELECT courses.id, courses.course_name, courses.course_code FROM entrol_course LEFT JOIN courses 
ON entrol_course.course_id=courses.id  WHERE entrol_course.reg_no = '" .$_POST["gradeStd"]."'";
                                $stmt = Database::Prepare($query);
                                $stmt->execute();
                                $data =  $stmt->fetchall();
                                foreach ($data as $results) {
                                    ?>
                                    <tr>
                                    <td><?php echo $results['course_name'] ?></td>
                                    <td><?php echo $results['course_code'] ?></td>
                                    <td>
                                    <?php
                                    $sql = "SELECT  grades.grade, results.id FROM results INNER JOIN grades ON results.grade=grades.id WHERE results.course_id = '" .$results["id"]."'";
                                    $stmt = Database::Prepare($sql);
                                    $stmt->execute();
                                    $totalRows =  $stmt->rowCount();
                                    $gradeLetter =  $stmt->fetchAll();
                                    if ($totalRows < 1){
                                        echo 'Not Graded Yet';
                                    }else {
                                        foreach ($gradeLetter as $grade) {
                                             echo  $grade['grade'];
                                        }
                                    }
                                    ?>
                                    </td>
                                    </tr>
                                    <?php
                                }
                            }
                            ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script>
    $('#date').datepicker({ dateFormat:'yy-mm-dd' });
</script>
<!--<script>-->
<!--    $(document).ready(function () {-->
<!--        $('#regNo').change(function () {-->
<!--            var result = $(this).val();-->
<!--            $.ajax({-->
<!--                url:"loader.php",-->
<!--                method:"POST",-->
<!--                data:{result:result},-->
<!--                dataType:"text",-->
<!--                success:function (data) {-->
<!--                    $('#std_detail').html(data);-->
<!--                }-->
<!--            });-->
<!--        });-->
<!--    });-->
<!--</script>-->
<!--<script>-->
<!--    $(document).ready(function () {-->
<!--        $('#regNo').change(function () {-->
<!--            var gradeStd = $(this).val();-->
<!--            $.ajax({-->
<!--                url:"loader.php",-->
<!--                method:"POST",-->
<!--                data:{gradeStd:gradeStd},-->
<!--                dataType:"text",-->
<!--                success:function (data) {-->
<!--                    $('#results').html(data);-->
<!--                }-->
<!--            });-->
<!--        });-->
<!--    });-->
<!--</script>-->
<?php include "footer.php"?>


<?php include "header.php"?>
<?php include "sidebar.php"?>
<?php
use App\Database\Database;
use App\Utility\Utility;
use App\Session\Session;
use App\Course\Course;
use App\Student\Student;
use App\Result\Result;
$result = new Result();
?>
<?php
$errors = array();
$name = "";
$email = "";
?>
<div class="content-wrapper">
    <section class="content">
        <div class="box box-default">
            <div class="box-header with-border text-center">
                <h1 class="box-title">View Assignments</h1>
            </div>
            <div class="box-body">
                <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">
                    <?php
                    echo Session::SuccessMsg();
                    echo Session::ErrorMsg();
                    ?>

                    <form action="submit.php" method="post" enctype="multipart/form-data">

                        <div class="form-group">
                            <label for="">Subject Name.</label>
                            <select id="courseID" name="courseID" class="form-control selectpicker" data-show-subtext="true"
                                    data-live-search="true">
                                <option value="">&larr; Select Course Name. &rarr;</option>
                                <?php
                                $id="";
                                foreach (Course::getAssigned_courses($_SESSION["userid"]) as $key => $value){ ?>
                                    <option value="<?php echo $value["course_id"]; ?>"><?php echo $value["course_code"]; ?></option>
                                <?php  } ?>
                            </select>
                            <?php if (!empty($errors['regNo'])){
                                echo Utility::error($errors["regNo"]);
                            } ?>

                        </div>

                    </form>
                    <br>
<!--                                        <div id="std_detail" class="form-group">-->
<!--                                            <label>Student Name</label>-->
<!--                                            <input type="text" name="name" class="form-control" readonly placeholder="Student Name...">-->
<!--                                            --><?php //if (!empty($errors['nameEmpty'])){
//                                                echo Utility::error($errors["nameEmpty"]);
//                                            } ?>
<!--                                            <br>-->
<!--                                            <label>Student ID</label>-->
<!--                                            <input type="email" name="email" class="form-control" readonly placeholder="Email...">-->
<!--                                            --><?php //if (!empty($errors['emailEmpty'])){
//                                                echo Utility::error($errors["emailEmpty"]);
//                                            } ?>
<!--                                            <br>-->
<!--                                            <label for="">Assignment</label>-->
<!--                                            <input type="text" name="department" class="form-control" readonly placeholder="Student Name-->
<!--                                            ...">-->
<!--                                            --><?php //if (!empty($errors['deptEmpty'])){
//                                                echo Utility::error($errors["deptEmpty"]);
//                                            } ?>
<!--                                        </div>-->
                                        <br>
                                        <div class="form-group">
                                            <table id="results" class="table table-striped table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>Student Name</th>
                                                    <th>Student ID</th>
                                                    <th>Assignment</th>
                                                </tr>
                                                </thead>
                                                <tbody id="std_detail">
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
<script>
    $(document).ready(function () {
        $('#courseID').change(function () {
            var assignment = $(this).val();
            $.ajax({
                url:"loader.php",
                method:"POST",
                data:{assignment:assignment},
                dataType:"text",
                success:function (data) {
//                    console.log(data);
                    $('#std_detail').html(data);
                }
            });
        });
    });
</script>

<?php include "footer.php"?>


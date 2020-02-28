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
                <h1 class="box-title">Submit Assignment</h1>
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
                            foreach (Course::getEnroll_courses($_SESSION["userid"]) as $key => $value){ ?>
                                <option value="<?php echo $value["id"]; ?>"><?php echo $value["course_code"]; ?></option>
                            <?php  } ?>
                        </select>
                        <?php if (!empty($errors['regNo'])){
                            echo Utility::error($errors["regNo"]);
                        } ?>

                    </div>


                    <div class="form-group">

                        <label for="">Select File.</label>
                        <input type="file" id="assFile" name="assFile">
                        <span class="help-block">*Max file size 5Mb</span>
<!--                        <div id="courseCode">-->
<!--                        </div>-->

                    </div>
                        <button type="submit" name="submit" class="btn btn-info">Submit</button>
                    </form>
                    <br>
                    <div class="form-group">
                        <?php
                        if (isset($_SESSION['success_message'])) {
                            ?>
                            <div class="content-group-sm">
                                <!-- Basic alert -->
                                <div class="alert alert-success alert-styled-left">
                                    <button type="button" class="close" data-dismiss="alert"><span>&times;</span><span
                                                class="sr-only">Close</span></button>
                                    <?php echo $_SESSION['success_message']; ?>
                                </div>
                            </div>
                            <?php
                            unset($_SESSION['success_message']);
                        }
                        ?>
                        <?php
                        if (isset($_SESSION['warning_message'])) {
                            ?>
                            <div class="content-group-sm">
                                <!-- Basic alert -->
                                <div class="alert alert-danger alert-styled-left">
                                    <button type="button" class="close" data-dismiss="alert"><span>&times;</span><span
                                                class="sr-only">Close</span></button>
                                    <?php echo $_SESSION['warning_message']; ?>
                                </div>
                            </div>
                            <?php
                            unset($_SESSION['warning_message']);
                        }
                        ?>
                    </div>
<!--                    <div id="std_detail" class="form-group">-->
<!--                        <label>Student Name</label>-->
<!--                        <input type="text" name="name" class="form-control" readonly placeholder="Student Name...">-->
<!--                        --><?php //if (!empty($errors['nameEmpty'])){
//                            echo Utility::error($errors["nameEmpty"]);
//                        } ?>
<!--                        <br>-->
<!--                        <label>Email</label>-->
<!--                        <input type="email" name="email" class="form-control" readonly placeholder="Email...">-->
<!--                        --><?php //if (!empty($errors['emailEmpty'])){
//                            echo Utility::error($errors["emailEmpty"]);
//                        } ?>
<!--                        <br>-->
<!--                        <label for="">Department</label>-->
<!--                        <input type="text" name="department" class="form-control" readonly placeholder="Student Name-->
<!--                        ...">-->
<!--                        --><?php //if (!empty($errors['deptEmpty'])){
//                            echo Utility::error($errors["deptEmpty"]);
//                        } ?>
<!--                    </div>-->
<!--                    <br>-->
<!--                    <div class="form-group">-->
<!--                        <table id="table_info" class="table table-striped table-bordered">-->
<!--                            <thead>-->
<!--                            <tr>-->
<!--                                <th>Course Name</th>-->
<!--                                <th>Course Code</th>-->
<!--                                <th>Grade</th>-->
<!--                            </tr>-->
<!--                            </thead>-->
<!--                            <tbody id="results">-->
<!--                            </tbody>-->
<!--                        </table>-->
<!--                    </div>-->
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
        $('#regNo').change(function () {
            var result = $(this).val();
            $.ajax({
                url:"loader.php",
                method:"POST",
                data:{result:result},
                dataType:"text",
                success:function (data) {
                    $('#std_detail').html(data);
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function () {
        $('#regNo').change(function () {
            var gradeStd = $(this).val();
            $.ajax({
                url:"loader.php",
                method:"POST",
                data:{gradeStd:gradeStd},
                dataType:"text",
                success:function (data) {
                    $('#results').html(data);
                }
            });
        });
    });
</script>
<?php include "footer.php"?>


<?php
session_start();
//print_r($_SESSION);
//print_r($_POST);
//print_r($_FILES);
//die();
include "../vendor/autoload.php";
use App\Database\Database;
?>
<?php
$crsID = $_SESSION["userid"];
$sql_m= "SELECT students.id FROM students LEFT JOIN users on students.email = 
users.email WHERE users.id = $crsID";
$stmt_m = Database::Prepare($sql_m);
$stmt_m->execute();
$data_m =  $stmt_m->fetch();
$stdID = $data_m['id'];
$sql= "SELECT students.reg_no FROM students WHERE students.id = $stdID";
$stmt = Database::Prepare($sql);
$stmt->execute();
$data =  $stmt->fetch();
$_POST['assRegNum'] = $data['reg_no'];
$courseID = $_POST['courseID'];
$sql_1= "SELECT courses.course_code FROM courses WHERE courses.id = $courseID";
$stmt_1 = Database::Prepare($sql_1);
$stmt_1->execute();
$data_1 =  $stmt_1->fetch();
$_POST['courseName'] = $data_1['course_code'];

//print_r($_POST);
//die();
if (!empty($_FILES['assFile']['name']) && !empty($_POST['courseName'])) {
    $filename = time() . "_" . $_POST['courseName'] . "_" . $_POST['assRegNum'];
    $fileext = explode('.', basename($_FILES['assFile']['name']));
    $file_extension = end($fileext);
    $file_name = $filename . "." . $file_extension;


        if ($_FILES['assFile']['size'] <= 5242880) {

            move_uploaded_file($_FILES['assFile']['tmp_name'], "files/" . $file_name);
            $_POST['assFile'] = $file_name;

            $reg_no   = $stdID;
            $course_id = $_POST['courseID'];
            $file = $_POST['assFile'];

            $sql = "INSERT INTO assignment (reg_no, course_id, file) VALUES (:reg_no, :course_id, :file)";
            $stmt = Database::Prepare($sql);
            $data = [
                ':reg_no'=>$reg_no,
                ':course_id' =>$course_id,
                ':file' =>$file,
            ];
            $status1 =  $stmt->execute($data);
            if (isset($_SESSION['success_message'])) {
                unset($_SESSION['success_message']);
                $_SESSION['success_message'] = '<h4>Submitted Successfully!</h4>';
                header('location:assignment-submission.php');
            } else {

                $_SESSION['success_message'] = '<h4>Submitted Successfully!</h4>';
                header('location:assignment-submission.php');
            }

//            $obj->setData($_POST);
//            $obj->infoStore();
        } else {
            if (isset($_SESSION['warning_message'])) {
                unset($_SESSION['warning_message']);
                $_SESSION['warning_message'] = '<h4>File size is more than 5MB!</h4>';
                header('location:assignment-submission.php');
            } else {

                $_SESSION['warning_message'] = '<h4>File size is more than 5MB!</h4>';
                header('location:assignment-submission.php');
            }
        }

}else{
    if (isset($_SESSION['warning_message'])) {
        unset($_SESSION['warning_message']);
        $_SESSION['warning_message'] = '<h4>Fields can not be empty!</h4>';
        header('location:assignment-submission.php');
    } else {

        $_SESSION['warning_message'] = '<h4>Fields can not be empty!</h4>';
        header('location:assignment-submission.php');
    }
}

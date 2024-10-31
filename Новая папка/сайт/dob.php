<?php           
              if (isset($_POST['add'])) {
                $name = mysqli_real_escape_string($db, $_POST["name1"]);
                $surname = mysqli_real_escape_string($db, $_POST["surname1"]);
                $em = mysqli_real_escape_string($db, $_POST["Email1"]);
                $ph = mysqli_real_escape_string($db, $_POST["phone1"]);
                $ps = mysqli_real_escape_string($db, $_POST["password1"]);
                $sql = "INSERT INTO users (name) VALUES ('$name')";
                   if(mysqli_query($db, $sql))
                   {
                   if($db->query($sql)) 
                   { 
                  echo "Данные успешно добавлены";
                  header("Location: " . $_SERVER['REQUEST_URI']);
                  exit();
                } 
             }
            }
            ?>
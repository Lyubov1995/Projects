   M S B A M L   `   `   `  ����M  ISkiEquipmentRental, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:SkiEquipmentRentalSkiEquipmentRental  5   	   &     SkiEquipmentRental.ListOfClients   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:SkiEquipmentRental     5   	     � Title$9  3Окно для просмотра клиентов��5   	   $	��450��6-   $	��800��6:    � 
ResizeMode$ NoResize=�6G    � WindowStartupLocation$ CenterScreen=�6]   .��5	      � .+�5   
   �� $	��800��6   $��55��6   $	��Top=�6)   ���#90F1FD.+�5      �� -   5         ��Name$ 	AddClient��5      $��20(�6(   ���#90F1FD���#90F1FD���#394d4f$%��Добавить клиента��6v   $��40��6�   $	��210��6�    �� Left$	 475��6�   
 �� Top$ 3��6�   $
��Left=�6�   $	��Top=�6�   �� 5      -   5        $
 Exit��5      $��20(�6#   ���#90F1FD���#90F1FD���#394d4f$��
Назад��6q   $��	690 5 0 0q�6�   $��40��6�   $��80��6�   6�   5      � 5   
   -   5         �Name$ UsersRequestLayer��5      $	��750��6*   $	��300��66   $��0 0 0 0q�6D   .+�5      �� -   5         ��Name$ Spisok��5      $ 60��6'   $��1��67   $��0 0 0 0q�6D   $	��750��6U    �� View 5      �� 5      .P�5      �� 	 �� Width$
	 auto��6)   $��ФИО��66   
 �� CellTemplate
 5      �� 5   "   .R�5   &   �� ��60   �� *FIO+6G   5   #   5      �� 5      $
	 auto��6)   $��Паспорт��66   
 5      �� 5   "   .R�5   &   �� ��60   �� *
Passport+6L   5    #   5"      �� 5#      $
	 auto��6)   $��День рождения��66   
 5$      �� 5%   "   .R�5&   &   �� ��61   �� *
Birthday+6M   5'   #   5)      �� 5*      $
	 auto��6)   $��
Адрес��66   
 5+      �� 5,   "   .R�5-   &   �� ��60   �� *Adress+6J   5.   #   50      �� 51      $
	 auto��6)   $��Телефон��66   
 52      �� 53   "   .R�54   &   �� $��15(�6G   ��60   �� *Phone+6W   55   #   57      58      5:      5;      5<      5=      
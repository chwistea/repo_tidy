x_train2<-read.table("./UCI HAR Dataset/train/x_train.txt")
y_train2<-read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train2<-read.table("./UCI HAR Dataset/train/subject_train.txt")

x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
names(x_test)<-features$V2
names(y_test)<-"y"
test<-cbind(y_test, x_test)
test<-cbind(subject_test, test)
test_merged<-merge(test, activity_labels, by.x="y", by.y="y", all=TRUE)
train_merged<-merge(train, activity_labels, by.x="y", by.y="y", all=TRUE)
##-To samo trzeba teraz zrobiæ dla danych testowych---------------

names(x_train)<-features$V2
names(y_train)<-"y"
Plik Y_train zawiera kolumnê, któr¹ dodajemy do X_train:
  train<-cbind(y_train2, x_train2)

  train<-cbind(subject_train2, train)

  activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_labels)<-c("y", "activity_label")


  typ<-vector(mode="character", length=2947)
typ2<-vector(mode="character", length=7352)
typ[]<-"test"
typ2[]<-"train"
test_merged2<-cbind(typ, test_merged)
train_merged2<-cbind(typ2, train_merged)
##Trzeba zmieniæ nazwê kolumny w drugiej tabeli, bo teraz mamy typ2
nazwy<-names(train_merged2)
nazwy[1]<-"typ"
names(train_merged2)<-nazwy
##---------------------------------
##  Teraz mo¿emy po³¹czyæ oba zbiory danych
all_data<-rbind(train_merged2, test_merged2)


  nazwy12<-grep("mean|std", nazwy)
nazwy12<-c(1, 2, 3, 565, nazwy12)
nazwy12<-nazwy[nazwy12]
mean_std<-all_data[,nazwy12]

grupy<-group_by(data_dist, subject, activity_label)
wynik<-summarise_each(grupy, funs(mean), 5:83)
write.table(wynik, file="tidy_data.txt", row.name=FALSE)
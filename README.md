# CwSeekerCloneDb
## Veritabanı Tabloları

### Closings Tablosu

| Alan İsmi | Tür     |
| ---------- | ------- |
| Id         | tinyint |
| Name       | varchar |

### CoverLetters Tablosu

| Alan İsmi     | Tür            |
| -------------- | -------------- |
| Id             | int            |
| UserId         | uniqueidentifier |
| NameLastName   | varchar        |
| Email          | varchar        |
| PhoneNumber    | varchar(20)    |
| PostalCode     | varchar(10)    |
| City           | varchar        |
| CustomProperty | varchar        |
| Buyer          | varchar        |
| DatePost       | varchar(20)    |
| EntranceId     | int            |
| StatusId       | int            |
| MotivationId   | int            |
| ClosingId      | int            |

### Cvs Tablosu

| Alan İsmi     | Tür            |
| -------------- | -------------- |
| Id             | tinyint        |
| UserId         | uniqueidentifier |
| Title          | varchar        |
| NameLastName   | varchar        |
| PhoneNumber    | varchar(20)    |
| Email          | varchar        |
| WebSite        | varchar        |
| Summary        | varchar        |
| About          | varchar(max)   |
| City           | varchar        |
| Address        | varchar        |

### Entrances Tablosu

| Alan İsmi | Tür     |
| ---------- | ------- |
| Id         | tinyint |
| Name       | varchar |

### Motivations Tablosu

| Alan İsmi | Tür     |
| ---------- | ------- |
| Id         | tinyint |
| Name       | varchar |

### Resumes Tablosu

| Alan İsmi | Tür     |
| ---------- | ------- |
| Id         | int     |
| CvId       | int     |
| CompanyName | varchar |
| Title      | varchar |
| Description | varchar |
| StartingDate | datetime |
| EndingDate | datetime |

### SocialMedias Tablosu

| Alan İsmi | Tür     |
| ---------- | ------- |
| Id         | int     |
| CvId       | int     |
| Name       | varchar |
| Link       | varchar |

### Statussess Tablosu

| Alan İsmi | Tür     |
| ---------- | ------- |
| Id         | tinyint |
| Name       | varchar |

### Users Tablosu

| Alan İsmi | Tür            |
| ---------- | -------------- |
| Id         | uniqueidentifier |
| UserName   | varchar        |
| Email      | varchar        |
| Password   | varchar        |

## View'ler ve Saklı Procedure'ların Mantıkları

### vwShowCvs (View CVs)

`vwShowCvs` view'i, kullanıcıların CV'lerini görüntülemek için oluşturulmuştur. Bu view, "Cvs" ve "Users" tablolarını birleştirir ve kullanıcı adı, e-posta, CV başlığı, ad-soyad, telefon numarası, e-posta, web sitesi, özet, hakkında, şehir ve adres gibi bilgileri içerir. Kullanıcılar CV'lerini görüntülerken bu view'i kullanabilirler.

### sp_InsertCv (CV Ekleme)

`sp_InsertCv` saklı procedure'u, yeni bir CV eklemek için kullanılır. Kullanıcı tarafından sağlanan bilgilerle bir CV kaydı oluşturur. Bu procedure, "Cvs" tablosuna yeni bir kayıt ekler ve kullanıcıların kendi CV'lerini oluşturmasına olanak tanır.

### sp_UpdateCv (CV Güncelleme)

`sp_UpdateCv` saklı procedure'u, mevcut bir CV'yi güncellemek için kullanılır. CV'nin kimliği belirtilen parametrelere göre güncellenir. Kullanıcılar bu procedure ile CV'lerini güncelleyebilirler.

### sp_DeleteCv (CV Silme)

`sp_DeleteCv` saklı procedure'u, belirtilen bir CV'yi silmek için kullanılır. CV'nin kimliği belirtilen parametreye göre veritabanından kaldırılır. Kullanıcılar CV'lerini silmek için bu procedure'ı kullanabilirler.

Bu view'ler ve saklı procedure'lar, kullanıcıların CV verilerini yönetmelerine yardımcı olurken, veritabanının düzenli ve güncel tutulmasını sağlar.

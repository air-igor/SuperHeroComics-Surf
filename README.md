# SuperHeroComics
Данное приложение разрабатывалось с учетом требований тестового задания.
<br>В качестве API было выбрано https://www.superheroapi.com

API предоставляет информацию о всех супергероях и злодеях из всех вселенных, а именно: силовую статистику, биографию, родственные связи, добрый/злой, аватар, альтер эго и др.

## Функционал приложения
Приложение включает в себя 4 экрана: список супергероев, просмотр детальной информации о герое, поиск героя, список избранных героев.

<p align = "center">
  <img src = "https://github.com/air-igor/SuperHeroComics-Surf/blob/main/SuperHeroComics-Surf/readme/screenLaunchSHC.png" width="30%" height="30%">
  <img src = "https://github.com/air-igor/SuperHeroComics-Surf/blob/main/SuperHeroComics-Surf/readme/previewSHC.gif" width="30%" height="30%">
</p>

## О реализации
<br> - Общение с интернетом и парсинг данных происходит нативным путем.
<br> - В качестве базы данных использовался Realm. Изображения загружаются и хранятся в кэше с помощью SDWebImage (опциально, можно исключить).
<br> - Данные загружаются с интернета и в случае ошибки выводится алерт. Есть возможность обновлять список супергероев на начальном экране. 


<p align = "center"><img src = "https://github.com/air-igor/SuperHeroComics-Surf/blob/main/SuperHeroComics-Surf/readme/internetErrorSHC.png" width="35%" height="35%"></p>

### Архитектура
В приложении используется Surf-MVP стандарт разработки UI-слоя. 
Реализованы 4 модуля: 
- HomeSuperHero (collectionView + adapter) и DetailSuperHero (tableView + adapter).
- SearchSuperHero (tableView + adapter) и FavoriteSuperHero (tableView + adapter).

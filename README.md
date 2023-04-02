# README

* ロリポップマネージドサーバーを使用しているためRubyは2.7.3

* 本番環境のデータベースはMySQL

* 従業員の情報はEmployeeモデルとコントローラー、労働時間の情報はWorkingTimeモデルとコントローラーが担当

* WokingTimeモデルはEmployeeモデルにbelongs_toで従属

* database.ymlは削除
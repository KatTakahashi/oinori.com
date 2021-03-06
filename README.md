# お祈り.com

## サイト概要

就職活動や転職活動でのお祈りメールを共有するサイトです。<br>


### ＜目的＞

就活生が励みになる環境を提供したく、本サイトを制作しました。<br>
私はプログラミングスクールを卒業し、未経験からのITエンジニア転職活動中です。<br>
私を含め、文系卒に加えて未経験からのエンジニアを目指している知り合いが<br>
企業様からお祈りされることが多いですが、納得のいく就活で終えたいと思いました。<br>
<br>
「私だけじゃないんだ」「みんなもお祈りされても頑張っているんだ」と思って頂き、<br>
心折れずに、みんなのお祈り文から学び反省をして自分自身の成長に繋げるきっかけとなれば幸いです。<br>

### ＜技術的目的＞

上記目的に加え、私はITエンジニアを目指しており、<br>
当Webアプリ制作を技術的なアウトプットの場としました。<br>
<br>

#### 挑戦したこと
- Rspecによるテスト(単体/正常・異常)
- gemを使わないログイン機能
- Google Natural Language API を活用した辛辣度(AI)機能
- 会員登録無しで投稿し、投稿者のみが削除できる機能(IPアドレスを活用)
- 無限lol/good(いいね)機能
- lol/good(いいね)の数による並び替え機能
- 24時間以内に投稿があった際のnotice機能
- アクセス数管理機能

### 設計書
![er_oinori](https://user-images.githubusercontent.com/92353507/163299089-5d769e32-d233-4ba9-a79f-f2eb4f2095ed.png)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1DMuRtC2PukbXW2W_3gKG85c0emMfW7MoTK6T70ZWwQY/edit?usp=sharing)
- [アプリケーション詳細設計](https://docs.google.com/spreadsheets/d/1ZkJgliSXROmLoB-JKmI2I0Qp8RcFxx2WYflJvdzIj6w/edit?usp=sharing)

### 開発環境

|                    |                                              |
| :----------------: | :------------------------------------------- |
|       **OS**       | Linux(CentOS)                                |
|      **言語**      | HTML, CSS, Ruby 2.6.3            |
| **フレームワーク** | Ruby on Rails 5.2.6                          |
|  **データベース**  | MySQL 5.7(本番環境), SQLite 3.7.17(開発環境) |
|   **Web サーバ**   | Nginx 1.20.0                                 |
|    **インフラ**    | AWS(EC2, RDS)                                |
|      **IDE**       | Cloud9                                       |
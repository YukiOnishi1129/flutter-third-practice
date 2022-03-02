import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Formのkeyを指定する場合は<FormState>としてGlobalKeyを定義する
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            // Columnを使い縦に並べる
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /**
               * タイトル
               */
                Text(
                  'Photo App',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: 16),
                /**
               * 入力フォーム(メールアドレス)
               */
                TextFormField(
                  decoration: InputDecoration(labelText: 'メールアドレス'),
                  keyboardType: TextInputType.emailAddress,
                  // メールアドレスのバリデーション
                  validator: (String? value) {
                    // メールアドレスが入力されていない
                    if (value?.isEmpty == true) {
                      return 'メールアドレスを入力してください。';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                /**
               *  入力フォーム(パスワード)
               */
                TextFormField(
                  decoration: InputDecoration(labelText: 'パスワード'),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  // パスワードのバリデーション
                  validator: (String? value) {
                    // パスワードが入力されていない場合
                    if (value?.isEmpty == true) {
                      return 'パスワードを入力してください。';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                /**
               * ログインボタン
               */
                SizedBox(
                  width: double.infinity,
                  // ボタン
                  child: ElevatedButton(
                    onPressed: () => _onSingIn(),
                    child: Text('ログイン'),
                  ),
                ),
                SizedBox(height: 8),
                /**
               * 新規登録ボタン
               */
                SizedBox(
                  width: double.infinity,
                  // ボタン
                  child: ElevatedButton(
                    onPressed: () => _onSingUp(),
                    child: Text('新規登録'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSingIn() {
    // 入力内容を確認する
    if (_formKey.currentState?.validate() != true) {
      // エラーメッセージがあるため処理を中断する
      return;
    }
  }

  void _onSingUp() {
    if (_formKey.currentState?.validate() != true) {
      // エラーメッセージがあるため処理を中断する
      return;
    }
  }
}

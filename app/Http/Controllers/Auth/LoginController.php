<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use App\Http\Requests\LoginRequest;
use Illuminate\Http\Request;
use App\Models\User;
use Validator;
use Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function getLogin() {
        return view('auth.login');
    }

    public function postLogin(LoginRequest $request) {
        $login = array(
            'email' => $request->email,
            'password' => $request->password
        );
        if (!Auth::attempt($login)) {
            $message = ['flash_level'=>'danger message-custom','flash_message'=>'Thông tin email/password sai.'];
            return redirect()->back()->with($message);
            //return view('pages.myStore');
        }
        else {
            //return view('pages.myStore');
            $check = $this->authenticated($request, $this->guard()->user());
            if ($check) {
                return redirect()->intended('/');
            }
            else {
                $message = ['flash_level'=>'warning message-custom','flash_message'=>'Bạn cần phải xác nhận tài khoản. Vui lòng kiểm tra email của bạn.'];
                return redirect()->Route('getLogin')->with($message);
            }
        }
    }
}

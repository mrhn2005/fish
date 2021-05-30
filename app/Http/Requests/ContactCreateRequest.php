<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ContactCreateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'username' => ['required', 'string', 'max:80'],
            'email' => ['nullable', 'email', 'max:100'],
            'subject' => ['nullable', 'string', 'max:100'],
            'message' => ['required', 'string', 'max:8000']
        ];
    }
}

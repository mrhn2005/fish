<?php

namespace App\Http\Controllers;

use App\Http\Requests\ContactCreateRequest;
use App\Models\Contact;

class ContactController extends Controller
{
    public function store(ContactCreateRequest $request)
    {
        Contact::create($request->validated());

        return redirect()->back()->with([
            'message' => 'Your message submitted successfully.'
        ]);
    }
}

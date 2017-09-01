<?php

namespace App\Http\Controllers\Client;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\ReadingVocabulary;

class ReadingVocabularyController extends Controller
{
    public function getVocabularyReading($domain) {
        $readingVocabularyModel = new ReadingVocabulary();
        $all_vocabulary = $readingVocabularyModel->getAllVocabulary();
        return view('client.readingVocabulary', compact('all_vocabulary'));
    }
}

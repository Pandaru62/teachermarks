<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class ClassController extends AbstractController
{
    #[Route('/class', name: 'app_class')]
    public function index(): Response
    {
        $classes = [
            ["1G4", "red"],
            ["1STMG2", "blue"],
            ["2D5", "green"],
        ];

        return $this->render('classes.html.twig', [
            'classes' => $classes,
        ]);
    }
    
}

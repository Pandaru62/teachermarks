<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class ShowClassController extends AbstractController
{
    #[Route('/class/{classname}', name: 'showClass', methods:['GET', 'HEAD'])]
    public function index(): Response
    {
        return $this->render('show_class/index.html.twig', [
            'controller_name' => 'ShowClassController',
        ]);
    }
}

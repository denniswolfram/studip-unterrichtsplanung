<?php

namespace Unterrichtsplanung\Routes\Textfields;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Unterrichtsplanung\Errors\AuthorizationFailedException;
use Unterrichtsplanung\Errors\Error;
use Unterrichtsplanung\UnterrichtsplanungTrait;
use Unterrichtsplanung\UnterrichtsplanungController;
use Unterrichtsplanung\Models\Textfields;

class TextfieldsGetById extends UnterrichtsplanungController
{
    use UnterrichtsplanungTrait;

    public function __invoke(Request $request, Response $response, $args)
    {
        $textfield = Textfields::find($args['id']);

        if ($textfield) {
            return $this->createResponse($textfield->toArray(), $response);
        } else {
            throw new Error('Textfield not found', 404);
        }
    }
}

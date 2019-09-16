<?php

namespace Unterrichtsplanung\Routes\Plans;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Unterrichtsplanung\Errors\AuthorizationFailedException;
use Unterrichtsplanung\Errors\Error;
use Unterrichtsplanung\UnterrichtsplanungTrait;
use Unterrichtsplanung\UnterrichtsplanungController;
use Unterrichtsplanung\Models\Plans;

class PlansUpdate extends UnterrichtsplanungController
{
    use UnterrichtsplanungTrait;

    public function __invoke(Request $request, Response $response, $args)
    {
        global $user;

        $json = $this->getRequestData($request, ['templates_id', 'name']);

        $plan = Plans::find($args['id']);

        if ($plan->user_id != $user->id) {
            throw new Error('Access denied!', 403);
        }

        $plan->setData([
            'name'         => $json['name'],
            'templates_id' => $json['templates_id']
        ]);

        $plan->store();

        return $this->createResponse($plan->toArray(), $response);
    }
}

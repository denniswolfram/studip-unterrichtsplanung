<?php

namespace Unterrichtsplanung\Providers;

class StudipConfig implements \Pimple\ServiceProviderInterface
{
    /**
     * Diese Methode wird automatisch aufgerufen, wenn diese Klasse dem
     * Dependency Container der Slim-Applikation hinzugefügt wird.
     *
     * @param \Pimple\Container $container der Dependency Container
     *
     * @SuppressWarnings(PHPMD.Superglobals)
     */
    public function register(\Pimple\Container $container)
    {
        $container['roles'] = [
            'admin' => 'Unterrichtsplanung_Admin'
        ]
    }
}

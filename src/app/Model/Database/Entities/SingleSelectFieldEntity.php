<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 17:35
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;

/**
 * Class SingleSelectFieldEntity
 * @package Stopka\MediaFactory\Model\Database\Entities
 * @ORM\Entity()
 */
class SingleSelectFieldEntity extends SelectFieldEntity
{
    public function __construct(string $internalName)
    {
        parent::__construct($internalName, new SingleSelectFieldValueEntity($this));
    }

}

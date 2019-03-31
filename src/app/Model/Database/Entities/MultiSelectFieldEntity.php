<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 17:33
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;

/**
 * Class MultiSelectFieldEntity
 * @package Stopka\MediaFactory\Model\Database\Entities
 * @ORM\Entity()
 */
class MultiSelectFieldEntity extends SelectFieldEntity
{
    public function __construct(string $internalName)
    {
        parent::__construct($internalName, new MultiSelectFieldValueEntity($this));
    }

}

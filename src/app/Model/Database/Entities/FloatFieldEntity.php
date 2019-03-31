<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 15:42
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;

/**
 * Class FloatFieldEntity
 * @package Stopka\MediaFactory\Model\Database\Entities\Fields
 * @ORM\Entity()
 */
class FloatFieldEntity extends FieldEntity
{
    public function __construct(string $internalName, ?float $value = null)
    {
        parent::__construct($internalName, new FloatFieldValueEntity($this, $value));
    }

}

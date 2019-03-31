<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 14:17
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;

/**
 * Class IntFieldEntity
 * @package Stopka\MediaFactory\Model\Database\Entities\Fields
 * @ORM\Entity()
 */
class IntFieldEntity extends FieldEntity
{
    public function __construct(string $internalName, ?int $defaultValue = null)
    {
        parent::__construct($internalName, new IntFieldValueEntity($this, $defaultValue));
    }

}

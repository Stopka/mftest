<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 15:51
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;

/**
 * Class StringFieldEntity
 * @package Stopka\MediaFactory\Model\Database\Entities\Fields
 * @ORM\Entity()
 */
class StringFieldEntity extends FieldEntity
{
    public function __construct(string $internalName, ?string $defaultValue)
    {
        parent::__construct($internalName, new StringFieldValueEntity($this, $defaultValue));
    }

}

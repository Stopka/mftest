<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 19:00
 */

namespace Stopka\MediaFactory\Model\Database\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * Class BoolFieldEntity
 * @package Stopka\MediaFactory\Model\Database\Entities\Fields
 * @ORM\Entity()
 */
class BoolFieldEntity extends FieldEntity
{
    public function __construct(string $internalName, ?bool $value = null)
    {
        parent::__construct($internalName, new BoolFieldValueEntity($this, $value));
    }
}

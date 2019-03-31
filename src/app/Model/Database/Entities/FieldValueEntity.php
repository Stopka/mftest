<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 14:37
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TIdentificationProperties;

/**
 * Class FieldValueEntity
 * @package Stopka\MediaFactory\Model\Database\Entities
 * @ORM\Entity()
 * @ORM\InheritanceType(value="JOINED")
 * @ORM\DiscriminatorColumn(name="type", type="string")
 */
abstract class FieldValueEntity
{
    use TIdentificationProperties;

    /**
     * @var FieldEntity
     * @ORM\ManyToOne(targetEntity="FieldEntity")
     */
    private $field;

    protected function __construct(FieldEntity $field)
    {
        $this->field = $field;
    }

    /**
     * @return FieldEntity
     */
    public function getField(): FieldEntity
    {
        return $this->field;
    }

}

<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 15:44
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;

/**
 * Class FloatFieldValueEntity
 * @package Stopka\MediaFactory\Model\Database\Entities
 * @ORM\Entity()
 */
class FloatFieldValueEntity extends FieldValueEntity
{
    /**
     * @var float|null
     * @ORM\Column(type="float", nullable=true)
     */
    private $value;

    public function __construct(FloatFieldEntity $field, ?float $value = null)
    {
        parent::__construct($field);
        $this->value = $value;
    }

    /**
     * @return float|null
     */
    public function getValue(): ?float
    {
        return $this->value;
    }

    /**
     * @param float|null $value
     */
    public function setValue(?float $value): void
    {
        $this->value = $value;
    }

}
